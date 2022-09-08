class BookingsController < ApplicationController
    def create
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @flat = Flats.find(params[:flat_id])
      @booking.flat = @flat
      @booking.total_price = @flat.price_day * (@booking.end_day - @booking.start_day)
      if @booking.save
        flash.notice = "Booking has been made"
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
