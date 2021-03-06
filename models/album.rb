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

  def self.find_album_by_id(input_id)
    sql = "SELECT * FROM albums WHERE id = #{input_id}"
    result = SqlRunner.run(sql)
    return Album.new(result.first)
  end

### INSTANCE
  def save
    sql = "INSERT INTO albums (artist_id, title, genre) VALUES (#{@artist_id},'#{@title}','#{@genre}') RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end  

  def artist
    sql = "SELECT * FROM albums WHERE id = #{@artist_id}"
    result = SqlRunner.run(sql)
    return Album.new(result.first)
  end

  def delete
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE albums SET (artist_id, title, genre) = (#{@artist_id},'#{@title}','#{@genre}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end





end

