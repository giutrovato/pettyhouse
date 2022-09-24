class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_profile
    @pets = current_user.pets
  end

  def pet_profile

  end
end
