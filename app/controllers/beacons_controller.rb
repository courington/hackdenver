class BeaconsController < ApplicationController

  def index
    beacons = Beacon.all
    render json: beacons, :content_type => 'application/json'
  end

end
