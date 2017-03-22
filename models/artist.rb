require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_writer :name

  def initialize(artist_hash)
    @id = artist_hash['id'].to_i
    @name = artist_hash['name']
  end


end

