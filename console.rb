require('pry')
require_relative('models/artist')
require_relative('models/album')

artist5 = Artist.new({ 'name' => 'artist5' })

artist5.save

album6 = Album.new({
  'artist_id' => artist5.id,
  'title' => 'album6',
  'genre' => 'genre3'
  })

album6.save
# album6.delete

# artist5.delete

artist5.name = 'Jake'
artist5.update



binding.pry
nil