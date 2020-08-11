class PlacesController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json:
        {
          places: [
            {
              id: 1,
              name: "Frogtown Brewery",
              image: "/frogtown_brewery.jpeg",
              lat: "34.107291",
              lon: "-118.251296",
              short_description: "A local hangout for craft beer",
              long_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras elementum neque non quam viverra pulvinar. Aliquam non ipsum viverra, tristique eros quis, fringilla elit. Vestibulum facilisis vulputate lorem. Mauris eget enim sit amet dolor tempus efficitur. Pellentesque aliquet nibh a tortor ultrices cursus. Praesent cursus malesuada lobortis. Quisque vehicula purus rhoncus augue tincidunt bibendum a at quam. Curabitur commodo sed ligula nec tempus. Nam vitae neque tempus, volutpat sem et, condimentum est. Aenean at dui nec ante molestie convallis et sit amet tellus."
            },
            {
              id: 2,
              name: "LA Central Library",
              image: "/central_library.jpeg",
              lat: "34.050518",
              lon: "-118.254896",
              short_description: "Central Library for the city of LA",
              long_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras elementum neque non quam viverra pulvinar. Aliquam non ipsum viverra, tristique eros quis, fringilla elit. Vestibulum facilisis vulputate lorem. Mauris eget enim sit amet dolor tempus efficitur. Pellentesque aliquet nibh a tortor ultrices cursus. Praesent cursus malesuada lobortis. Quisque vehicula purus rhoncus augue tincidunt bibendum a at quam. Curabitur commodo sed ligula nec tempus. Nam vitae neque tempus, volutpat sem et, condimentum est. Aenean at dui nec ante molestie convallis et sit amet tellus."
            }
          ]
        }
      }
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

  private

  def place_params
    params.require(:place).permit(:name, :description, :category)
  end
end