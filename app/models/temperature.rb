class Temperature < ApplicationRecord

    default_scope { order(created_at: :desc) }

    def group_by_date
        created_at.to_date.to_s
    end

    def self.reduce_temperatures
        all_temps = self.all.group_by(&:group_by_date)
        days_ago = 0
        all_temps.each do |key, temps_in_day|
            next if temps_in_day.count <= 2
            days_ago += 1
            resolution = temps_in_day.count / days_ago
            resolution = resolution.to_i
            resolution = 2 if resolution < 2
            temps_in_day.in_groups(resolution) do |temps_over_range|
                temps_over_range.compact!
                sum = 0
                total_over_range = temps_over_range.count
                temps_over_range.each_with_index do |temp, i|
                    sum += temp.measure
                    if i == total_over_range - 1
                        temp.measure = (sum / total_over_range).round(2)
                        temp.save
                    else
                        temp.delete
                    end
                end
            end
        end
        return
    end

end
