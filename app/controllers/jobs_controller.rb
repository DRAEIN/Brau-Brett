class JobsController < ApplicationController
	before_action :set_job, only: [:show, :edit, :update, :destroy]


	def index
      @jobs = Job.recent
	end

	def new
	  @job = current_user.jobs.build
	end

	def create
      @job = current_user.jobs.build(job_params)
      respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
        flash[:alert] = "Job konnte nicht erstellt werden, bitte alle Felder ausfüllen!"
      end
    end
  end

  def show
	end

	def edit
	end

	def update
	  respond_to do |format|
        if @job.update(job_params)
          format.html { redirect_to @job, notice: 'Job was successfully updated.' }
          format.json { render :show, status: :ok, location: @job }
        else
          format.html { render :edit }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end

	def destroy
	  @job.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

	private

	def job_params
		params.require(:job).permit(:Titel, :Beschreibung, :Ort, :avatar)
	end
    
  def set_job
  	@job = Job.find(params[:id])
  end

end
