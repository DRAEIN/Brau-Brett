class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update, :destroy]
	access all: [:show, :index], user: :all, site_admin: :all
	

    def index
    	@profiles = Profile.all.page(params[:page]).per(10)
    end

	def new
      @profile = Profile.new(user: current_user)
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
	@profile.destroy
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
