class BeaconsController < ApplicationController

  def index
    render json: Beacon.all.to_json
  end

  def show
    beacon = Beacon.find(params[:id])
    json = {
      beacon: beacon.attributes.to_hash.slice('lat', 'lng', 'description', 'duration'),
      user:  beacon.user
    }
    render json: json.to_json
  end
end
