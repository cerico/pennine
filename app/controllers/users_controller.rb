class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favs = @user.bookmarks.where(favourited:true)
    @completed = @user.bookmarks.where(completed:true)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end
end
