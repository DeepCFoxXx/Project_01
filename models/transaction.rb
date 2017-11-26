require_relative('../db/sql_runner.rb')
require_relative('./account_holder.rb')

class Transaction

 attr_reader :id, :merchant_name, :value, :tag, :account_holder_id

 def initialize(options)
  @id = options['id'].to_i
  @merchant_name = options['merchant_name']
  @value = options['value'].to_s
  @tag = options['options']
  @account_holder_id = options['account_holder_id'].to_i
 end

 def save()
   sql = "INSERT INTO transactions
   (
    merchant_name,
    value,
    tag,
    account_holder_id
    )
    values
    (
    $1, $2, $3, $4
    )
    RETURNING *"
    values = [@merchant_name, @value, @tag, @account_holder_id]
    transaction_data = SqlRunner.run(sql,values)
    @id = transaction_data.first()['id'].to_i
 end

end
