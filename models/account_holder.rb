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
    values = [@name, @funds, @tag, @transaction_id]
    account_holder_data = SqlRunner.run(sql,values)
    @id = account_holder_data.first()['id'].to_i
 end

end
