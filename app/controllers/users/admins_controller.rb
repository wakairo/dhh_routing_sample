class Users::AdminsController < ApplicationController
  before_action :set_user, only: %i[ update destroy ]

  def index
    @users = User.admin
  end

  def new
    @users = User.not_admin
  end

  def update
    msg =
      if @user.update(admin: true)
        "#{@user.name} was successfully made admin."
      else
        "Making admin failed."
      end
    redirect_to users_admins_path, status: :see_other, notice: msg
  end

  def destroy
    msg =
      if @user.update(admin: false)
        "#{@user.name} was successfully removed from admin."
      else
        "Removing from admin failed."
      end
    redirect_to users_admins_path, status: :see_other, notice: msg
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end
end
