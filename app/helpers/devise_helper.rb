module DeviseHelper
<<<<<<< HEAD
  def devise_error_messages_flash
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      #{sentence}
      <ul>#{messages}</ul>
    </div>
    HTML

    warning = '<div><b>There was an error updating your account.</b></div></br>'
    flash[:warning] = warning.html_safe + html.html_safe
  end

  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <b>#{sentence}</b>
      <ul>#{messages}</ul>
    </div>
    HTML
    html.html_safe
  end
=======

  def devise_error_simple_message
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| msg + '<br/>' }.join
    html = yield(messages) if block_given?
    html ||= <<-HTML
        <div class="alert alert-danger">
        <p>#{messages}</p>
        </div>
      HTML
    html.html_safe
  end

  def devise_error_messages_flash
    devise_error_simple_message do |messages|
      sentence = I18n.t("errors.messages.not_saved",
                        :count => resource.errors.count,
                        :resource => resource.class.model_name.human.downcase)
      <<-HTML
        <div class="alert alert-danger">
        <strong>#{sentence}</strong>
        <p>#{messages}</p>
        </div>
      HTML
    end
  end

>>>>>>> 641369618ab1bf3b41b9e9ea6706ae3c417188ba
end
