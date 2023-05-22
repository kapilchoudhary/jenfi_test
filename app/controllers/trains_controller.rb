class TrainsController < ApplicationController
before_action :find_parcels, only: %i[show]

  def index
    if current_user.role == "train_operator"
      @trains =  Train.where("user_id = ?",current_user.id).order('cost ASC')
    else
      @trains = Train.all 
    end
      redirect_to root_path, notice: 'There are no trains yet!'  if @trains.empty?
  end
  
  def new
    @train = Train.new
  end

  def create
    @train = Train.new(train_params)
    @train.user_id = current_user.id
    
    @train.remaining_weight_capacity = @train.total_weight
    @train.remaining_volume_capacity = @train.total_volume
    
    if @train.save!
      create_train_line
      redirect_to trains_path, notice: 'Your Train is been submited successfully!'
    else
      @train.errors.full_messages
    end
  end

  def update
    
    @train = Train.find(params[:id])
    @train.update(assigned_line: train_params[:train_lines].to_i, status: "left", left_at: Time.current)
    Line.find(@train.assigned_line).engaged!
  end

  def show
    @train = Train.where("id= ?", params[:id]).first
  end

  def withdraw
    
  end

  def create_train_line
    params[:train][:line_ids].reject(&:empty?).each do |line_id|
      @trainline = TrainLine.new(train_id: @train.id, line_id:  line_id)
      @trainline.save
    end
  end

  def add_parcels
    @train = Train.find(params[:id])
    @parcel = Parcel.find(params[:parcel])
    if @train.remaining_weight_capacity >= @parcel.weight && @train.remaining_volume_capacity >= @parcel.volume
      weight_capacity = @train.remaining_weight_capacity - @parcel.weight
      volume_capacity = @train.remaining_volume_capacity - @parcel.volume
      @parcel.update(status: "shipping", train_id: params[:id])
      @train.update(remaining_weight_capacity: weight_capacity, remaining_volume_capacity: volume_capacity)
    else
      @train.update(status: 1)   
      redirect_to add_parcels_train_path, notice: 'Train is fully booked!'
    end
  end

  private

  def train_params
    params.require(:train).permit( :name, :cost, :total_weight, :total_volume, :status, :remaining_weight_capacity, :remaining_volume_capacity, :train_lines, :left_at)
  end
  
  def find_parcels
    @parcels = Parcel.all.where("status = ?", 0)
  end
end