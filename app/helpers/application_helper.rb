module ApplicationHelper
    def full_title(title='')
        base_title='Time off'
        title.empty? ? base_title : "#{title} | #{base_title}"
    end
end
