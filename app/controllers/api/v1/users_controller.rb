class Api::V1::UsersController < ApplicationController

  before_action :find_user, only: [:show, :update]

  def index 
    @users = User.all
    render json: @users, status: :ok
  end 

  def show
    render json: @user, status: :accepted
  end

   def create
    @user = User.create(user_params)
    if @user.valid?
      render json: @user, status: :created
    else
      render json: { errors: @users.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end


  private

  def user_params
    params.permit(:id)
  end 

  def find_user
    @user = User.find(params[:id])
  end 
end
