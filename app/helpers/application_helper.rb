module ApplicationHelper
  def user_actions(current_user)
    html = ''

    if current_user
      html += "Welcome #{current_user.name}!"
      html += ' | '
      html += link_to('LOGOUT', logout_path, class: 'mr-2 ml-2')
    else
      html += link_to('REGISTER', sign_up_path, class: 'mr-2 ml-2')
      html += ' | '
      html += link_to('LOGIN', login_path, class: 'mr-2 ml-2')
    end
    html.html_safe
  end

  def create_article
    html = ''
    if current_user
      html += ' | '
      html += link_to('Create article', new_travel_path)
    end

    html.html_safe
  end

  def link_to_article
    html = ''
    html += '<li>'
    html += link_to 'WRITE AN ARTICLE', new_travel_path unless current_user.nil?
    html += '</li>'
    html.html_safe
  end

  def show_alert
    html = ''
    if flash.alert.present?
      html += "<div class='alert alert-primary text-center' role='alert'>
        #{flash.alert}
        </div>"
    end
    html.html_safe
  end

  def show_notice
    html = ''
    if flash.notice.present?
      html += "<div class='alert alert-warning text-center' role='alert'>
        #{flash.notice}
        </div>"
    end
    html.html_safe
  end

  def show_content(y_content)
    html = ''
    if @no_footer.nil?
      html += "<main class='container text-white mb-5'>
      #{y_content}
      </main>"
      html += render partial: 'layouts/footer'
    else
      html += "<main class='container text-white'>
      #{y_content}
      </main>"
    end
    html.html_safe
  end

  def set_default_image
    'https://www.samsung.com/etc/designs/smg/global/imgs/support/cont/NO_IMG_600x600.png'
  end
end
