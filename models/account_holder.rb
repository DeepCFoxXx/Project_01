require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')
require_relative('./merchant.rb')
require_relative('./tag.rb')

class AccountHolder

  attr_reader :id, :first_name, :last_name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @funds = options['funds'].to_s
  end

  def save()
    sql = "INSERT INTO account_holders
    (
      first_name,
      second_name,
      funds
    )
    values
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@first_name, @second_name, @funds]
    account_holder_data = SqlRunner.run(sql,values)
    @id = account_holder_data.first()['id'].to_i
  end


  def update()
    sql = "UPDATE account_holders SET
    (
      first_name,
      second_name,
      funds
    )
    values
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@first_name, @second_name, @funds]
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

  def self.find(id)
    sql = "SELECT * FROM account_holders WHERE id = $1"
    values = [id]
    account_holders = SqlRunner.run(sql, values)
    result = AccountHolder.new(account_holder.first)
  end

end
