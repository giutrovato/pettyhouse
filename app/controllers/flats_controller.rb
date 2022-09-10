class FlatsController < ApplicationController

  # def index
  #   @flats = Flat.all
  # end

  def index
    @flats = Flat.all
    if params[:query].present?
      # @flats = Flat.where(category: params[:query])
      sql_quer = "title ILIKE :query OR address ILIKE :query"
      @flats = Flat.where(sql_quer, query: "%#{params[:query]}%")
    end
  end

  def new
    @flat =  Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, photos: [])
  end

  def flat_params
    params.require(:flat).permit(:title, :address, :price, :description, :pet_min_size, :pet_max_size, photos: [])
  end
end
