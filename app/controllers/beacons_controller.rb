class BeaconsController < ApplicationController

  def index
    render json: Beacon.all.as_json(include: :user)
  end

  def new
    if not current_user.beacon.blank?
      redirect_to :action => :edit, :lat => params[:beacon_lat], :lng => params[:beacon_lng]
    else
      @beacon = Beacon.new
    end
  end

  def edit
    @beacon = current_user.beacon
  end

  def update
    current_user.beacon.update_attributes(params[:beacon])
    redirect_to root_path
  end

  def create
    beacon = Beacon.create(params[:beacon].merge({user: current_user}))
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
    if not current_user.beacon.blank?
      current_user.beacon.destroy
    end
  end
end
