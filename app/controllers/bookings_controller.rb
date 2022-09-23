class BookingsController < ApplicationController
  before_action :set_flat, only: [:create]

    def create
      @booking = Booking.new()
      @booking.user = current_user
      @booking.flat = @flat
      dates = params[:other][:booking_dates].split(" to ")
      @booking.start_date = Date.parse(dates[0])
      @booking.end_date = Date.parse(dates[1])
      @booking.total_price = @flat.price * (@booking.end_date - @booking.start_date)

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
      params.require(:booking).permit(:start_date, :end_date)
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_flat
      @flat = Flat.find(params[:flat_id])
    end
  end
