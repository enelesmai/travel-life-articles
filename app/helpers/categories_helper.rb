module CategoriesHelper
    def show_current_image(item)
        html = ''
        if item.image.attached?
            html += image_tag(item.image,  options = {class:'article-img col-6 col-no-padding'})
        else
            html += "<div class='article-img col-6 col-no-padding' style='background-image: url(#{item.default_image})'></div>"
        end
        html.html_safe
    end

    def show_link_to_vote(item)
        html = ''
        html+= link_to 'Vote!', votes_path(user_id: current_user, travel_id: item.id, category_id: @category.id), method: :post, class: 'fa fa-thumbs-up header-color vote' if !current_user.nil?
        html.html_safe
    end
end
