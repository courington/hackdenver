class BeaconsController < ApplicationController

  def index
    render json: Beacon.all.as_json(include: :user)
  end

  def new
    @beacon = Beacon.new
  end

  def create
    beacon = Beacon.create(params[:beacon].merge({user: current_user}))
    redirect_to root_path
  end

  def show
    beacon = Beacon.find(params[:id])
    render json: {
        beacon: beacon.attributes.to_hash.slice('lat', 'lng', 'description', 'duration'),
        user: beacon.user,
        twitter: FullContact.twitter_json(beacon.user.email)
    }.to_json
  end

  def destroy
    if not current_user.beacon.blank?
      current_user.beacon.destroy
    end
  end
end
