class Holiday < ApplicationRecord
    def as_json
        {
          :title => self.title,
          :start => self.start_date,
          :end => self.end_date
        }
    end
end
