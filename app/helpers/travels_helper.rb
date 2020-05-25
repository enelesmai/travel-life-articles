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
  def show_featured_traveling_article
    html = ''
    if @featured_traveling_article.nil?
      html += image_tag(@featured_traveling_article.default_image,  options = {class:'article-image'})
      html += "<h3 class='header-color'>There is no articles</h3>"
    else
      html += image_tag(@featured_traveling_article.image,  options = {class:'img-feat d-flex align-items-end'}) if @featured_traveling_article.image.attached?
      html += image_tag(@featured_traveling_article.default_image,  options = {class:'article-image-full'}) if !@featured_traveling_article.image.attached? 
      html += "<div class='content-feat position-relative font-weight-bold p-2'>
                <h3 class='header-color'>#{@featured_traveling_article.title}</h3>
                <span>#{@featured_traveling_article.text.truncate(80)}</span>
            </div>"
    end
    html.html_safe
  end
  def show_articles(item)
    html = ''
    if !item.travels.first.nil?
      puts 'entra'
      html += "<div class='featured-box'>"
      if item.travels.order(created_at: :desc).first.image.attached?
        html += link_to travel_path(item.travels.first.id) do
                image_tag(item.travels.order(created_at: :desc).first.image,  options = {class:'article-image-full'}) end
      end
      if !item.travels.order(created_at: :desc).first.image.attached?    
        html += link_to travel_path(item.travels.first.id) do 
                image_tag(item.travels.order(created_at: :desc).first.default_image, options = {class:'article-image-full'}) end
      end
      html += "<div class='d-flex flex-column align-items-start top'>"
      html += "<b>"
      html += link_to item.name, category_path(item.id), class:'link-category'
      html += "</b>"
      html += "</div>"
      html += "<div class='d-flex flex-column align-items-start resume'><span>"
      html += link_to item.travels.order(created_at: :desc).first.title, travel_path(item.travels.order(created_at: :desc).first.id), class:'link'
      html += "</span></div>"
      html += "</div>"
    end
    puts 'test articles'
    puts html
    html.html_safe
  end
end
