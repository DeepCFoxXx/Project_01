require_relative('../models/merchant.rb')
require_relative('../models/account_holder.rb')
require_relative('../models/transaction.rb')


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

        # account_holder1.delete()
        # account_holder2.delete()
        # account_holder3.delete()
        # account_holder4.delete()

        merchant1 = Merchant.new ({
          "merchant_name" => "ASDA",
          "value" => 20,
          "tag" => "WD40"
          })

          merchant2 = Merchant.new ({
            "merchant_name" => "Tesco",
            "value" => 15,
            "tag" => "Blue Bread"
            })

            merchant3 = Merchant.new ({
              "merchant_name" => "Morrisons",
              "value" => 30,
              "tag" => "First Aid Kit"
              })

              merchant4 = Merchant.new ({
                "merchant_name" => "M n S",
                "value" => 35,
                "tag" => "Tuscan Pasta"
                })

               merchant1.save
               merchant2.save
               merchant3.save
               merchant4.save

              #  merchant1.delete()
              #  merchant2.delete()
              #  merchant3.delete()
              #  merchant4.delete()


              transaction1 = Transaction.new({'account_holder_id' => accountholder1.id,
                                              'merchant_id' => merchant1.id})

              transaction2 = Transaction.new({'account_holder_id' => accountholder2.id,
                                              'merchant_id' => merchant2.id})

              transaction3 = Transaction.new({'account_holder_id' => accountholder3.id,
                                              'merchant_id' => merchant3.id})

              transaction4 = Transaction.new({'account_holder_id' => accountholder4.id,
                                              'merchant_id' => merchant4.id})

              transaction1.save
              transaction2.save
              transaction3.save
              transaction4.save

              # transaction1.delete()
              # transaction2.delete()
              # transaction3.delete()
              # transaction4.delete()                                
