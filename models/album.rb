require('pg')
require_relative('../db/sql_runner')

class Album

  attr_reader :id
  attr_writer :title, :genre

  def initialize(album_hash)
    @id = album_hash['id'].to_i
    @artist_id = album_hash['artist_id'].to_i
    @title = album_hash['title']
    @genre = album_hash['genre']
  end

### CLASS
  def self.all()
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return result.map{|album| Album.new(album)}
  end

### INSTANCE
  def save
    sql = "INSERT INTO albums (artist_id, title, genre) VALUES (#{@artist_id},'#{@title}','#{@genre}') RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end  





end

