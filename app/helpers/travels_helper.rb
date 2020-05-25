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
  def show_comments
    html = ''
    if !@travel.comments.count.zero?
      html += "<h4>Comments</h4>"
      html += render partial: 'travels/comment', collection: @travel.comments
    end
    html.html_safe
  end
  def show_image
    html = ''
    html += image_tag(@travel.image, options = {class:'article-image'}) if @travel.image.attached?
    html += image_tag(@travel.default_image, options = {class:'article-image'}) if !@travel.image.attached?
    html.html_safe
  end
end
