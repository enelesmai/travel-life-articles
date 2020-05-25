module CommentsHelper
  def show_ask_author(form)
    html = ''
    html += '<p>'

    if current_user.nil?
      html += form.label :author_name, 'Your Name:'
      html += '<br>'
      html += form.text_field :author_name, class: 'form-control'
    else
      html += form.label :author_name, "Your Name: #{current_user.name}"
      html += form.hidden_field :author_name, value: current_user.name
    end
    html += '</p>'
    html.html_safe
  end
end
