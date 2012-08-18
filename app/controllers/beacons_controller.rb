class BeaconsController < ApplicationController

  def index
    render json: Beacon.all.as_json(include: :user)
  end

  def create
    if not params[:lat].blank? and not params[:lng].blank? and not params[:description].blank? and not params[:duration].blank?
      beacon = Beacon.create({
        :lat         => params[:lat],
        :lng         => params[:lng],
        :description => params[:description],
        :duration    => params[:duration]
      })
      render json: {:status => 'success', :id => beacon.id, :lat => beacon.lat, :lng => beacon.lng}.to_json
    end
  end

  def show
    beacon = Beacon.find(params[:id])
    render json: {
        beacon: beacon.attributes.to_hash.slice('lat', 'lng', 'description', 'duration'),
        user: beacon.user
    }.to_json
  end

  def destroy
    if not params[:id].blank?
      if beacon = Beacon.first(:conditions => ['id = ?', params[:id]])
        beacon.destroy
        render json: {:status => 'success'}.to_json
      else
        render json: {:status => 'none found'}.to_json
      end
    else
      render json: {:status => 'failure'}.to_json
    end
  end
end
