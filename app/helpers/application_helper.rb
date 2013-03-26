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
end
