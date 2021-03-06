class PlacesController < ApplicationController
  before_action :require_signin

  def index
    @places = Place.all
    respond_to do |format|
      format.json { render json: @places }
      format.html
      format.csv { send_data @places.to_csv }
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def edit
    @place = Place.find(params[:id])
  end

  def create
    @place = Place.new(place_params)
    @place.save!
    redirect_to @place
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to @place
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy!
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:en_name,
                                  :es_name,
                                  :en_description,
                                  :es_description,
                                  :category,
                                  :lat,
                                  :lon, 
                                  :remote_img)
  end
end
