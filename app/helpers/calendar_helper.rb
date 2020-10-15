module CalendarHelper
    def user_wants_to_create_event
        @create_event=true
    end

    def create_event?
        return @create_event
    end
end
