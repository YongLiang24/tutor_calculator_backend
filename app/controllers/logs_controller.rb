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
    if log_params[:isClear]
      @logs.results.clear
      @logs.save
      render json: @logs
    else
      @logs.results = @logs.results << log_params[:results]
      @logs.save
      render json: @logs
    end
  end

  private

  def log_params
    params.permit(:isClear, :log, :results, :id, results: [])
  end

end
