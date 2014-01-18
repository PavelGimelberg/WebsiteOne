module DeviseHelper
  def devise_error_messages_flash
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

    flash[:alert] = 'There was an error updating your account.'
    flash[:warning] = html.html_safe
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
end