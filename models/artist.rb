require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name
  attr_writer :name

  def initialize(artist_hash)
    @id = artist_hash['id'].to_i
    @name = artist_hash['name']
  end

### CLASS
  def self.all()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    return result.map{|artist| Artist.new(artist)}
  end

  def self.find_artist_by_id(input_id)
    sql = "SELECT * FROM artists WHERE id = #{input_id}"
    result = SqlRunner.run(sql)
    return Artist.new(result.first)
  end

### INSTANCE
  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end  

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    result = SqlRunner.run(sql)
    return result.map {|album| Album.new(album)}
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end



end

