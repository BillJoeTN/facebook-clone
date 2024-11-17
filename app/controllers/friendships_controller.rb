class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])
    if @friendship.save
      redirect_to root_path, notice: 'Friend request sent.'
    else
      redirect_to root_path, alert: 'Error sending friend request.'
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to root_path, notice: 'Friend removed.'
  end
end