class JobsController < ApplicationController
  skip_forgery_protection

  def index
    @jobs = Job.all
    render 'jobs/index'
  end

  def create 
    @job = Job.new(job_params)

    if @job.save
      render 'jobs/create'
    end
  end

  def show
    @job = Job.find_by(id: params[:id])

    render 'jobs/show'
  end

  
  private

  def job_params
    params.require(:job).permit!
  end
end
