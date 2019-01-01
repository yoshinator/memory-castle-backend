class Api::V1::MemoriesController < ApplicationController

  before_action :find_memory, only: [:show, :update, :destroy]

  def index 
    @memories = Memory.all
    render json: @memories, status: :ok
  end 

  def show
    render json: @memory, status: :accepted
  end

   def create
    @memory = Memory.create(memory_params)
    if @memory.valid?
      render json: @memory, status: :created
    else
      render json: { errors: @memories.errors.full_messages }, status: :unprocessible_entity
    end
  end


  def update
    @memory.update(memory_params)
    if @memory.save
      render json: @memory, status: :accepted
    else
      render json: { errors: @memory.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @castle = Castle.find(@memory.castle_id)
    @memory.destroy
    render json: @castle, status: :accepted
  end

  private

  def memory_params
    params.permit(:id, :text, :x, :y, :castle_id)
  end 

  def find_memory
    @memory = Memory.find(params[:id])
  end 
end