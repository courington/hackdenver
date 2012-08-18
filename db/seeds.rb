Beacon.destroy_all
User.destroy_all

Beacon.create!(
  [
    { user: User.create!({ email: 'dlogan21@gmail.com', first_name: 'Dan', last_name: 'Logan'}),
      lat: '39.762459',
      lng: '-104.980738',
      description: 'Coding some GO @ Novo Cofee',
      duration: 2
    },
    { user: User.create!({ email: 'levicook@gmail.com', first_name: 'Levi', last_name: 'Cook'}),
      lat: '39.761055',
      lng: '-104.982477',
      description: 'General Hacking, go/ruby/whatev @ Crema Coffee House',
      duration: 1
    },
   { user: User.create!({ email: 'cory@lanou.com', first_name: 'Cory', last_name: 'LaNou'}),
      lat: '39.750972',
      lng: '-104.987671',
      description: 'Hacking up some ruby code with facebook apis @ Flying Dog Brewery',
      duration: 4
    }
  ]
)
