require('pg')
require_relative('../db/sql_runner')

class Album

  attr_writer :title, :genre

  def initialize(album_hash)
    @id = album_hash['id'].to_i
    @artist_id = album_hash['artist_id'].to_i
    @title = album_hash['title']
    @genre = album_hash['genre']
  end

  def self.all()
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return result.map{|album| Album.new(album)}
  end





end

