class Test < ApplicationRecord

    default_scope { order(created_at: :desc) }

    def group_by_date
        created_at.to_date.to_s
    end

    def self.reduce_tests
        all_tests = self.all.group_by(&:group_by_date)
        days_ago = 0
        all_tests.each do |key, tests_in_day|
            next if tests_in_day.count <= 2
            days_ago += 1
            resolution = tests_in_day.count / days_ago
            resolution = resolution.to_i
            resolution = 2 if resolution < 2
            tests_in_day.in_groups(resolution) do |tests_over_range|
                sum = 0
                total_over_range = tests_over_range.count
                tests_over_range.each_with_index do |test, i|
                    sum += test.measure
                    if i == total_over_range - 1
                        test.measure = (sum / total_over_range).round(2)
                        test.save
                    else
                        test.delete
                    end
                end
            end
        end
        return
    end
end
