class ParcelsController < ApplicationController  
  def index
    if current_user.role == "parcel_owner"
      @parcels = current_user.parcels
    elsif current_user.role == "train_operator"
      @parcels =  Parcel.joins(:trains).where(trains: {user_id: current_user.id}) 
    else
    @parcels = Parcel.all 
    end
      redirect_to root_path, notice: 'There are no parcels yet!'  if @parcels.empty?
  end
  
  def new
    @parcel = Parcel.new
  end

  def create
    @parcel = Parcel.new(parcel_params)
    @parcel.user_id = current_user.id
    
    if @parcel.save!
      redirect_to parcels_path, notice: 'Your Parcel is been submited successfully!'
    else
      @parcel.errors.full_messages
    end
  end

  def withdraw
    Parcel.find(params[:format]).withdrawn!
  end

  private

  def parcel_params
    params.require(:parcel).permit( :weight, :volume, :status)
  end
end
