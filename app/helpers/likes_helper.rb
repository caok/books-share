#encoding: utf-8
module LikesHelper
  def like_link_for(target)
    link_to "收藏", like_path(:resource_name => target  .class, :resource_id => target.id), :method => :post
  end

  def unlike_link_for(target)
    link_to "取消收藏", like_path(:resource_name => target.class, :resource_id => target.id), :method => :delete
  end
end