class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user

  def profile
    # @favourites = @user.find_liked_items
  end

  def favourites
    # @favourites = @user.find_liked_items
  end

  private

  def find_user
    @user = current_user
  end
end
