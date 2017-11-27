require_relative('../db/sql_runner.rb')
require_relative('./account_holder.rb')
require_relative('./merchant.rb')

class Transaction

  attr_reader :id, :merchant_id, :account_holder_id

  def initialize(options)
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @account_holder_id = options['account_holder_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (
      merchant_id,
      account_holder_id
    )
    values
    (
      $1, $2
    )
    RETURNING *"
    values = [@merchant_id, @account_holder_id]
    transaction_data = SqlRunner.run(sql,values)
    @id = transaction_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE transactions SET
    (
      merchant_id,
      account_holder_id
    )
    values
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@merchant_id, @account_holder_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    values = []
    transactions = SqlRunner.run(sql, values)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    transactions = SqlRunner.run(sql, values)
    result = Transaction.new(transaction.first)
  end

end
