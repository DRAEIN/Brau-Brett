class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update, :destroy]
	

    def index
    	@profiles = Profile.all
    end

	def new
      if current_user.profile.blank?
        @profile = current_user.build_profile
      else
      	redirect_to root_path
      	flash[:notice] = "Du besitzt bereits ein Profil"
      end
	end

	def create
		@profile = current_user.build_profile(profile_params)
		if @profile.save
			redirect_to @profile
		else
			flash[:notice] = "Das Profil konnte nicht erstellt werden, bitte fülle alle Felder aus!"
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
	  respond_to do |format|
        if @profile.update(profile_params)
          format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @profile }
        else
          format.html { render :edit }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
    end

	def destroy
	@job.destroy
	  respond_to do |format|
	  	format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
	  	format.json { head :no_content }
	  end
	end

	private

	def profile_params
		params.require(:profile).permit(:Titel, :Beschreibung, :Name, :profileavatar)
	end

	def set_profile
		@profile = Profile.find(params[:id])
	end

	
end
