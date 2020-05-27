class Api::V1::CastlesController < ApplicationController

  before_action :find_castle, only: [:show, :update, :destroy]

  def index 
    @castles = Castle.all
    render json: @castles, status: :ok
  end 

  def show
    render json: @castle, status: :accepted
  end

   def create
    @castle = Castle.create(castle_params)
    if @castle.valid?
      render json: @castle, status: :created
    else
      render json: { errors: @castles.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @castle.update(castle_params)
    if @castle.save
      render json: @castle, status: :accepted
    else
      render json: { errors: @castle.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @user = User.find(@castle.user_id)
    @castle.destroy
    render json: @user, status: :accepted
  end


  private

  def castle_params
    params.require(:castle).permit(:id, :name, :user_id, :image)
  end 

  def find_castle
    @castle = Castle.find(params[:id])
  end 
end