module CategoriesHelper
  def show_current_image(item)
    html = ''
    # rubocop:disable Lint/UselessAssignment
    html += if item.image.attached?
              image_tag(item.image, options = { class: 'article-img col-6 col-no-padding' })
            else
              "<div class='article-img col-6 col-no-padding'
              style='background-image: url(#{item.default_image})'></div>"
            end
    # rubocop:enable Lint/UselessAssignment
    html.html_safe
  end

  def show_link_to_vote(item)
    html = ''
    unless current_user.nil?
      html += link_to 'Vote!', votes_path(user_id: current_user, travel_id: item.id),
                      method: :post, class: 'fa fa-thumbs-up header-color vote'
    end
    html.html_safe
  end

  def show_categories_grid
    html = ''
    @travels_by_category.each_with_index do |item, i| 
      html += "<div class='article-card' style='flex-direction:" + ((i/2).floor() % 2 == 0 ? 'row' : 'row-reverse') + ";'>"
      html += show_current_image(item)
      html += "<article class='article-box col-6 col-no-padding col-only-left-padding'>
                <h5>#{ @category.name }</h5>
                <p class='title'>#{ item.title }</p>
                <p>
                    Author: #{ item.author.name } | 
                    #{ item.total_votes }
                    #{ show_link_to_vote(item) }
                </p>
                <p>#{ item.text.truncate(100) }</p>"
      html += link_to "Read more", travel_path(item.id), class:'link-article header-color'
      html += "</span></article></div>"
    end
    html.html_safe
  end

end
