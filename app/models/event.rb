class Event < ApplicationRecord
    def as_json(options={})
        {
          :title => options[:is_team] ? self.email + " - " + self.title : self.title,
          :start => self.start_date,
          :end => self.end_date,
          :color => self.is_approved ? 'green' : 'purple' 
        }
    end
end
