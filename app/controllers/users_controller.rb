class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favs = @user.bookmarks.where(favourited:true)
    @completed = @user.bookmarks.where(completed:true)
    @added = Trail.where(user_id:@user.id)
    @distance = view_context.distance_calc(@completed)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user,  root: false  }
    end
  end
end
