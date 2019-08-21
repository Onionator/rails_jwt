class DestinationsController < ApplicationController
  before_action :authorize_request

  def index
    @destinations = Destination.all
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    @destination.create!(destination_params)
    json_response(@destination)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)

    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    if @destination.destroy!

    end
  end

  private
  def destination_params
    params.permit(:city, :country)
  end
  def json_response(object, status = :ok)
    render json: object, status: status
  end

end
