require_relative('../db/sql_runner.rb')
require_relative('./merchant.rb')
require_relative('./tag.rb')
require('pry')

class Transaction

  attr_reader :id, :merchant_id, :account_holder_id, :tag_id, :value

  def initialize(options)
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @value = options['value'].to_s
  end

  def self.total_value()
    sql = "SELECT sum(value) FROM transactions"
    values = []
    values = SqlRunner.run(sql, values)
    value = values.first
    return value['sum']
  end

  def save()
    sql = "INSERT INTO transactions
    (
      merchant_id,
      tag_id,
      value
    )
    values
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@merchant_id, @tag_id, @value]
    transaction_data = SqlRunner.run(sql,values)
    @id = transaction_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE transactions SET
    (
      merchant_id,
      tag_id,
      value
    )
    values
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@merchant_id, @tag_id, @value]
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

  # method for getting tag object for a transaction
  def tag
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    tag_data = SqlRunner.run(sql, values).first
    result = Tag.new(tag_data)
  end

  # method for getting merchant object for a transaction
  def merchant
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    merchant_data = SqlRunner.run(sql, values).first
    Merchant.new(merchant_data)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.destroy(id)
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
