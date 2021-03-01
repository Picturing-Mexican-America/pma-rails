class Api::V1::PlacesController < ApplicationController
  def index
    @places = Place.all
    render json: @places #each_serializer: Api::V1::PropSerializer
  end

  def show
    @place = Place.find(params[:id])
    render json: @places
  end

  private

end
