require('pry')
require_relative('models/artist')
require_relative('models/album')

artist5 = Artist.new({ 'name' => 'artist5' })

artist5.save



binding.pry
nil