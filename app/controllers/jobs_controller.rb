class JobsController < ApplicationController
	before_action :set_job, only: [:show, :edit, :update, :destroy]


	def index
      @jobs = Job.all
	end

	def new
	  @job = Job.new
	end

	def create
      @job = Job.new(job_params)
      if @job.save
      	redirect_to @job
      else
      	render 'new'
      end
    end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def job_params
		params.require(:job).permit(:Titel, :Beschreibung, :Ort)
	end
    
    def set_job
    	@job = Job.find(params[:id])
    end

end
