class BeaconsController < ApplicationController

  def index
    render json: Beacon.all.to_json
  end

  def create
    if not params[:lat].blank? and not params[:long].blank? and not params[:description].blank? and not params[:duration].blank?
      Beacon.create(
          :lat => params[:lat],
          :long => params[:long],
          :description => params[:description],
          :duration => params[:duration]
      )
    else
      return {:status => 'failure'}.to_json
    end
  end

  def show
    beacon = Beacon.find(params[:id])
    render json: {
      beacon: beacon.attributes.to_hash.slice('lat', 'lng', 'description', 'duration'),
      user:  beacon.user
    }.to_json
  end
end
