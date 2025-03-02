class UsersController < ApplicationController
  before_action :doorkeeper_authorize!
  skip_before_action :doorkeeper_authorize!, only: %i[create]
  before_action :set_user, only: %i[ show update destroy ]
  include UsersHelper

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  def my_profile
    @user = User.find(doorkeeper_token.resource_owner_id)
  end

  # GET /users/1
  def show
  end

  # POST /users
  def create
    # client_app = Doorkeeper::Application.find_by(uid: params[:client_id])

    # return render(json: { error: 'Invalid client ID'}, status: 403) unless client_app

    @user = User.new(create_user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if doorkeeper_token.resource_owner_id == @user.id
      if @user.update(update_user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You are not authorized to perform this action' }, status: 403
    end

  end

  # DELETE /users/1
  def destroy
    if doorkeeper_token.resource_owner_id == @user.id
      if @user.destroy
        render json: { message: 'User deleted successfully' }, status: 200
      else
        render json: { error: 'An error occurred while deleting the user' }, status: 500
      end
    else
      render json: { error: 'You are not authorized to perform this action' }, status: 403
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def create_user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :headline, :about, :city, :type, :password, :profile_picture)
    end

    def update_user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :headline, :about, :city, :profile_picture)
    end
end
