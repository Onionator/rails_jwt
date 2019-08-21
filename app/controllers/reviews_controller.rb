class ReviewsController < ApplicationController
  def index
    @destination = Destination.find(params[:destination_id])
    @reviews = @destination.reviews.all
    json_response(@reviews)
  end

  def show
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @destinaton.reviews.create!(review_params)
    json_response(@review)
  end

  def update
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    if @destination.reviews.update(review_params)

    end
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    if @review.destroy!

    end
  end

private
def json_response(object, status = :ok)
  render json: object, status: status
end

  def review_params
    params.permit(:review, :city, :country)
  end
end
