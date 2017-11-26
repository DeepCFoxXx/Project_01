require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')

class AccountHolder

 attr_reader :id, :name, :funds, :transaction_id

 def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @funds = options['funds'].to_s
  @transaction_id = options['transaction_id'].to_i
 end

 def save()
   sql = "INSERT INTO account_holders
   (
    name,
    funds,
    transaction_id
    )
    values
    (
    $1, $2, $3
    )
    RETURNING *"
    values = [@name, @funds, @transaction_id]
    account_holder_data = SqlRunner.run(sql,values)
    @id = account_holder_data.first()['id'].to_i
 end


 def update()
   sql = "UPDATE account_holders SET
   (
    name,
    funds,
    transaction_id
    )
    values
    (
    $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @funds, @transaction_id]
    SqlRunner.run(sql, values)
 end

 def delete()
   sql = "DELETE FROM account_holders WHERE id  =$1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

 def self.all()
    sql = "SELECT * FROM account_holders"
    values = []
    account_holders = SqlRunner.run(sql, values)
    result = account_holders.map { |account_holder| AccountHolder.new(account_holder) }
    return result
 end

end
