class FollowsController < ApplicationController
  before_filter :find_book
  def create
    current_user.follow @book
    redirect_to :back, :notice => 'success'
  end

  def destroy
    current_user.stop_following @book
    redirect_to :back, :notice => 'success' 
  end
  private
  def find_book
    @book = Book.find params[:id]
  end
end