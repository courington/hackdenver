class BeaconsController < ApplicationController

  def index
    render json: Beacon.all.as_json(include: :user)
  end

  def new
    @beacon = Beacon.new
  end

  def create
    beacon = Beacon.create(params[:beacon].merge({ user: current_user }))
    redirect_to root_path
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
