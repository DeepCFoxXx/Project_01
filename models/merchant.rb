require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')
require_relative('./account_holder.rb')

class Merchant

  attr_reader :id, :merchant_name, :value, :tag, :transaction_id

  def initialize(options)
    @id = options['id'].to_i
    @merchant_name = options['merchant_name']
    @value = options['value'].to_s
    @tag = options['tag']
    @transaction_id = options['transaction_id'].to_i
  end

  def save()
    sql = "INSERT INTO merchants
    (
      merchant_name,
      vlaue,
      tag,
      transaction_id
    )
    values
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@merchant_name, @value, @tag, @transaction_id]
    account_holder_data = SqlRunner.run(sql,values)
    @id = account_holder_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE merchants SET
    (
      merchant_name,
      value,
      tag,
      transaction_id
    )
    values
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@merchant_name, @value, @tag, @transaction_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    values = []
    transactions = SqlRunner.run(sql, values)
    result = transactions.map { |merchant| Merchant.new(merchant) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    merchants = SqlRunner.run(sql, values)
    result = Merchant.new(transaction.first)
  end

end
