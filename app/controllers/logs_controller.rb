class LogsController < ApplicationController

  def index
    @logs = Log.all
    render json: @logs
  end

  def create
    @logs = Log.create(log_params)
    render json: @logs
  end

  def update
    @logs = Log.find(log_params[:id])
    @logs.results = @logs.results << log_params[:results]
    @logs.save
    render json: @logs
  end

  private

  def log_params
    params.permit(:log, :results, :id, results: [])
  end

end
