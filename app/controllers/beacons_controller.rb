class BeaconsController < ApplicationController

  def index
    beacons = Beacon.all
    render json: beacons, :content_type => 'application/json'
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

end
