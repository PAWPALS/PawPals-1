class PetCheckinsController < ApplicationController

  def show
    @pet = Pet.find_by!(params[:pet_id])
    if @pet.sync_from_api
      @pet_check_in = PetCheckIn.where(params[:pet_id]).last
       render "pet_checkin_show.json.jbuilder", status: :accepted
    else
      render json: {errors: @pet.errors.full_messages },
             status: :unprocessable_entity
    end
  end
end

