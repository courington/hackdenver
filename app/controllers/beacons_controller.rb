class BeaconsController < ApplicationController

  def index
    beacons = [
      { id: 1, lat: 39.743943, lng: -105.020089, user: { name: "Hank"  } },
      { id: 2, lat: 39.753943, lng: -105.020089, user: { name: "Bill"  } },
      { id: 3, lat: 39.763943, lng: -105.020089, user: { name: "Bob"   } },
      { id: 4, lat: 39.773943, lng: -105.020089, user: { name: "Joe"   } },
      { id: 5, lat: 39.783943, lng: -105.020089, user: { name: "Frank" } },
    ]

    render json: beacons
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
