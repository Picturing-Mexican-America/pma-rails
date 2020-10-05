# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Place.create!([
  {
    en_name: 'En-Frogtown Brewery',
    es_name: 'Es-Frogtown Brewery',
    en_description: 'en-frogtown brewery description',
    es_description: 'es-frogtown brewery description',
    category: 'brewery',
    lat: 34.107025,
    lon: -118.25136
  },
  {
    en_name: 'En-Golden Road Brewery',
    es_name: 'En-Golden Road Brewery',
    en_description: 'en-golden road brewery description',
    es_description: 'es-golden road brewery description',
    category: 'brewery',
    lat: 34.150672,
    lon: -118.274452
  },
  {
    en_name: 'En-Mohawk Bend',
    es_name: 'Es-Mohawk Bend',
    en_description: 'en-Mohawk Bend description',
    es_description: 'es-Mohawk Bend description',
    category: 'restaurant',
    lat: 34.077695 ,
    lon: -118.264768
  }
])

# Template
# en_name:
# es_name:
# en_description:
# es_description:
# category:
# lat:
# lon:
