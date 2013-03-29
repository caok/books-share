module ApplicationHelper
  def flash_class(flash_key)
    flash_key == :notice ? 'alert-success' : "alert-#{flash_key}"
  end

  def render_close_icon(dismiss = 'alert')
    link_to '&times;'.html_safe, '#', :class => 'close', 'data-dismiss' => dismiss
  end

  def body_attributes
    class_attributes = [user_signed_in? ? 'signed_in' : 'signed_out']
    {
      :class =>  class_attributes
    }
  end

  def render_user_bar
    if user_signed_in?
      render 'signed_in_user_bar'
    else
      render 'signed_out_user_bar'
    end
  end

  def render_flashes
    unless @_flahses_rendered
      @_flahses_rendered = true
      render 'common/flashes'
    end
  end

  # http://twitter.github.com/bootstrap/components.html#labels-badges
  def format_labels(labels, color = '')
    label_color = color.empty? ? "label" : "label label-#{color}"
    html = ''
    labels.each do |label|
      html += content_tag(:span, label.name, :class => label_color) + ' '
    end
    html.html_safe
  end

  def format_tags(tags)
    html = ''
    tags.each do |tag|
      html += content_tag(:i, '', :class => 'icon-tag') + tag.name + ' '
    end
    html.html_safe
  end
end
