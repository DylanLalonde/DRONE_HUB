class BookingsController < ApplicationController
  before_action :set_booking, only: [ :new, :show, :create,]

  def show
  end

  def new
    @booking = Booking.new
    @users = User.all
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @booking.user = @user
    @booking.drone = @drone
    if @booking.save
      redirect_to dashboard_path
    else
      render "drones"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @drone = Drone.find(params[:drone_id])
  end
  def booking_params
    params.require(:booking).permit(:status, :user_id, :start_date, :end_date)
  end

end
