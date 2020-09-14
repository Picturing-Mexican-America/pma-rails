class WelcomeController < ApplicationController
  def index
    @place_count = Place.count
  end
end
