class Ph < ApplicationRecord

    default_scope { order(created_at: :desc) }

    def group_by_date
        created_at.to_date.to_s
    end

    def self.reduce_ph
        all_ph = self.all.group_by(&:group_by_date)
        days_ago = 0
        all_ph.each do |key, ph_in_day|
            next if ph_in_day.count <= 2
            days_ago += 1
            offset = 0.5
            if days_ago > 4
                offset = 0.25
            end
            resolution = ph_in_day.count / (days_ago * offset)
            resolution = resolution.to_i
            resolution = 2 if resolution < 2
            ph_in_day.in_groups(resolution) do |ph_over_range|
                ph_over_range.compact!
                sum = 0
                total_over_range = ph_over_range.count
                ph_over_range.each_with_index do |ph, i|
                    sum += ph.measure
                    if i == total_over_range - 1
                        ph.measure = (sum / total_over_range).round(2)
                        ph.save
                    else
                        ph.delete
                    end
                end
            end
        end
        return
    end

end
