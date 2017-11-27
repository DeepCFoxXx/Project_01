require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')
require_relative('./account_holder.rb')
require_relative('./merchant.rb')

class Tag

 attr_reader :id, :name

 def initialize(options)
   @id = options['id'].to_i
   @name = options['name']
 end

 def save()
   sql = "INSERT INTO tags
   (
     name
   )
   values
   (
     $1
   )
   RETURNING *"
   values = [@name]
   account_holder_data = SqlRunner.run(sql,values)
   @id = account_holder_data.first()['id'].to_i
 end

 def update()
   sql = "UPDATE tags SET
   (
     name
   )
   values
   (
     $1
   )
   WHERE id = $2"
   values = [@name]
   SqlRunner.run(sql, values)
 end

 def delete()
   sql = "DELETE FROM tags WHERE id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

 def self.all()
   sql = "SELECT * FROM tags"
   values = []
   tags = SqlRunner.run(sql, values)
   result = tags.map { |tag| Tag.new(tag) }
   return result
 end

 def self.find(id)
   sql = "SELECT * FROM tags WHERE id = $1"
   values = [id]
   tags = SqlRunner.run(sql, values)
   result = Tag.new(tag.first)
 end

end
