class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end

  # def show
  # end

  # def create
  # end

  # def update
  # end

  # def destroy
  # end
end
