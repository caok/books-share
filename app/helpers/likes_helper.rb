#encoding: utf-8
module LikesHelper
  def like_link_for(target)
    link_to t('helpers.like.like'), like_path(:resource_name => target  .class, :resource_id => target.id), :method => :post
  end

  def unlike_link_for(target)
    link_to t('helpers.like.unlike'), like_path(:resource_name => target.class, :resource_id => target.id), :method => :delete
  end
end