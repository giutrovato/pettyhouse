class BookingsController < ApplicationController
    def create
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @booking = Booking.find(params[:booking_id])
      @booking.flat = @flat
      @booking.total_price = @flat.price.truncate_day * (@booking.end_day - @booking.start_day)
      if @booking.save
        flash.notice = "Has made a new booking!"
        redirect_to booking_path(@booking)
      else
        render :new
      end
    end

    def index
      @bookings = current_user.bookings
    end

    def new
      @booking = Booking.new
    end

    def show
      @booking = Booking.find(params[:id])
    end

    def update
      @booking = Booking.find(params[:id])
      @booking.update(booking_params)
    end

    private

    def booking_params
      params.require(:booking).permit(:status, :total_price, :start_day, :end_day)
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end
  end
