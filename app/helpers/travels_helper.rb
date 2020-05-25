module TravelsHelper
  def travels_by_category(category)
    Category.where(category).travels.order(created_at: :desc)
  end
  def show_errors
    html = ''
    if @travel.errors.any?
      html += "<div class='alert alert-warning text-center' role='alert'>"
        @travel.errors.full_messages.each do |msg| 
          html += "<p>#{msg}</p>"
        end
      html += "</div>"
    end
    html.html_safe
  end
end
