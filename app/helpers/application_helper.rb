module ApplicationHelper
  def flash_class(flash_key)
    flash_key == :notice ? 'alert-success' : "alert-#{flash_key}"
  end

  def render_close_icon(dismiss = 'alert')
    link_to '&times;'.html_safe, '#', :class => 'close', 'data-dismiss' => dismiss
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
  def format_labels(labels, color = '', type = 'tag')
    label_color = color.empty? ? "label" : "label label-#{color}"
    html = ''
    labels.each do |label|
      html += content_tag :span, :class => label_color  do
        case type
        when "tag"
          link_to label, tag_path(label)
        when "author"
          link_to label, author_path(label)
        when "translator"
          link_to label, translator_path(label)
        end
      end
    end
    html.html_safe
  end

  def format_tags(tags)
    html = ''
    tags.each do |tag|
      html += content_tag :span, :class => 'tag' do
        content_tag(:i, '', :class => 'icon-tag') + link_to(tag, tag_path(tag))
      end
    end
    html.html_safe
  end

  MOBILE_USER_AGENTS =  'palm|blackberry|nokia|phone|midp|mobi|symbian|chtml|ericsson|minimo|' +
                        'audiovox|motorola|samsung|telit|upg1|windows ce|ucweb|astel|plucker|' +
                        'x320|x240|j2me|sgh|portable|sprint|docomo|kddi|softbank|android|mmp|' +
                        'pdxgw|netfront|xiino|vodafone|portalmmm|sagem|mot-|sie-|ipod|up\\.b|' +
                        'webos|amoi|novarra|cdm|alcatel|pocket|iphone|mobileexplorer|mobile'
  def mobile?
    agent_str = request.user_agent.to_s.downcase
    return false if agent_str =~ /ipad/
    agent_str =~ Regexp.new(MOBILE_USER_AGENTS)
  end
end
