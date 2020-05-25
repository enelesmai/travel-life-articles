module CommentsHelper
    def show_ask_author(f)
        html = ''
        html += '<p>'
            
        if current_user.nil?
            html += f.label :author_name, "Your Name:"
            html += '<br>'
            html += f.text_field :author_name, class: 'form-control'
        else
            html += f.label :author_name, "Your Name: #{current_user.name}"
            html += f.hidden_field :author_name, :value => current_user.name
        end
        html += '</p>'
        html.html_safe
    end
end
