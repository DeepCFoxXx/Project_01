require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')
require_relative('./tag.rb')

class Merchant

  attr_reader :id, :merchant_name

  def initialize(options)
    @id = options['id'].to_i
    @merchant_name = options['merchant_name']
  end

  def save()
    sql = "INSERT INTO merchants
    (
      merchant_name
    )
    values
    (
      $1
    )
    RETURNING *"
    values = [@merchant_name]
    account_holder_data = SqlRunner.run(sql,values)
    @id = account_holder_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE merchants SET
    (
      merchant_name
    )
    values
    (
      $1
    )
    WHERE id = $2"
    values = [@merchant_name]
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
    merchants = SqlRunner.run(sql, values)
    result = merchants.map { |merchant| Merchant.new(merchant) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    merchants = SqlRunner.run(sql, values)
    result = Merchant.new(merchant.first)
  end

end
