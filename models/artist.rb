require('pg')
require_relative('../db/sql_runner')

class Artist

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
  
### INSTANCE
  def save
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end  





end

