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

end



# [
#   { user: User.create!({ email: 'dlogan21@gmail.com', first_name: 'Dan', last_name: 'Logan'}),
#     lat: '39.762459',
#     long: '-104.980738',
#     description: 'Coding some GO @ Novo Cofee',
#     duration: 2
#   },
#   { user: User.create!({ email: 'cory@lanou.com', first_name: 'Cory', last_name: 'LaNou'}),
#     lat: '39.750972',
#     long: '-104.987671',
#     description: 'Hacking up some ruby code with facebook apis @ Flying Dog Brewery',
#     duration: 2
#   }
# ]
#
