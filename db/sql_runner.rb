class SqlRunner

  def self.run(sql_statement)
    begin
      db = PG.connect({dbname: 'music_collection', host: 'localhost'})
      result = db.exec(sql_statement)
    ensure  
      db.close
    end
    return result
  end
end