require_relative('account_holder.rb')
require_relative('transaction.rb')


account_holder1 = AccountHolder.new ({
  "first_name" => "Luke",
  "last_name" => "Skywalker",
  "funds" => 200
  })

account_holder2 = AccountHolder.new ({
  "first_name" => "Rey",
  "last_name" => "Solo",
  "funds" => 15
  })

account_holder3 = AccountHolder.new ({
  "first_name" => "Kylo",
  "last_name" => "Ren",
  "funds" => 1000
  })  

account_holder4 = AccountHolder.new ({
  "first_name" => "Mara Jade",
  "last_name" => "Skywalker",
  "funds" => 230
  })



account_holder1.save
account_holder2.save
account_holder3.save
account_holder4.save
