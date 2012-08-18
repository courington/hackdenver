class BeaconsController < ApplicationController

  def index
    render json: Beacon.all.as_json(include: :user)
  end

  def create
    if not params[:lat].blank? and not params[:lng].blank? and not params[:description].blank? and not params[:duration].blank?
      Beacon.create(
        :lat         => params[:lat],
        :lng         => params[:lng],
        :description => params[:description],
        :duration    => params[:duration]
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

  def destroy
    if not params[:id].blank?
      if beacon = Beacon.first(:conditions => ['id = ?', params[:id]])
        beacon.destroy
      end
    end
  end
end
