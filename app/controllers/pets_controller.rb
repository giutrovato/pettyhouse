class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.pet_type = params[:flat][:pet_type].join(",")
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to my_profile_path
  end

  private

  def article_params
    params.require(:article).permit(:name, :breed, :size, photos: [])
  end

  def pet_params
    params.require(:pet).permit(:name, :breed, :size, :photo)
  end
end
