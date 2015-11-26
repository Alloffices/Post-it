class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    respond_to do |format|
      # Ajax redirect to back upon follow
      format.html { redirect_to :back }
      # Ajax js redirect to back page location.reload
      format.js {render inline: "location.reload();" }
    end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    respond_to do |format|
      # Ajax redirect to back un follow
      format.html { redirect_to :back }
      # Ajax js redirect to back page location.reload
      format.js {render inline: "location.reload();" }
    end
  end
end
