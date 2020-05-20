module ApplicationHelper
    def user_actions(current_user)
        html = ''

        if current_user
            html += "#{current_user.name}"
            html += ' - '
            html += link_to('Log Out', logout_path)
        else
            html += link_to('Sign Up', sign_up_path)
            html += ' or '
            html += link_to('Log In', login_path)
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
