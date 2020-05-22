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
end
