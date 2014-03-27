class Api::JobsController < ApplicationController
  def index
    @jobs = Job.starts_with(params[:number])
    render json: @jobs.as_json(include: :images), :callback => params[:callback]
  end

  def show
    @job = Job.find(params[:id])
    render json: @job.to_json(include: :images), :callback => params[:callback]
  end

  def create
    render json: Job.create(params[:employee])
  end

  def update
    render json: Job.update(params[:id], params[:employee])
  end

  def destroy
    render json: Job.destroy(params[:id])
  end
end