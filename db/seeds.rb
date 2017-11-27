require_relative('../models/merchant.rb')
require_relative('../models/account_holder.rb')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')


account_holder1 = AccountHolder.new ({
  "first_name" => "Luke",
  "second_name" => "Skywalker",
  "funds" => 200
  })

  account_holder2 = AccountHolder.new ({
    "first_name" => "Rey",
    "second_name" => "Solo",
    "funds" => 15
    })

    account_holder3 = AccountHolder.new ({
      "first_name" => "Kylo",
      "second_name" => "Ren",
      "funds" => 1000
      })

      account_holder4 = AccountHolder.new ({
        "first_name" => "Mara Jade",
        "second_name" => "Skywalker",
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
          "merchant_name" => "ASDA"
          })

          merchant2 = Merchant.new ({
            "merchant_name" => "Tesco"
            })

            merchant3 = Merchant.new ({
              "merchant_name" => "Morrisons"
              })

              merchant4 = Merchant.new ({
                "merchant_name" => "M n S"
                })

                merchant1.save
                merchant2.save
                merchant3.save
                merchant4.save

                #  merchant1.delete()
                #  merchant2.delete()
                #  merchant3.delete()
                #  merchant4.delete()

                tag1 = Tag.new({
                  "name" => "Business"
                  })

                  tag2 = Tag.new({
                    "name" => "Personal"
                    })

                    tag3 = Tag.new({
                      "name" => "Private"
                      })

                      tag4 = Tag.new({
                        "name" => "Monthly"
                        })

                        tag1.save
                        tag2.save
                        tag3.save
                        tag4.save

                        # tag1.delete()
                        # tag2.delete()
                        # tag3.delete()
                        # tag4.delete()

                        transaction1 = Transaction.new({
                          "account_holder_id" => accountholder1.id,
                          "merchant_id" => merchant1.id,
                          "tag_id" => tag1.id,
                          "value" => 20
                          })

                          transaction2 = Transaction.new({
                            "account_holder_id" => accountholder2.id,
                            "merchant_id" => merchant2.id,
                            "tag_id" => tag2.id,
                            "value" => 15
                            })

                            transaction3 = Transaction.new({
                              "account_holder_id" => accountholder3.id,
                              "merchant_id" => merchant3.id,
                              "tag_id" => tag3.id,
                              "value" => 50
                              })

                              transaction4 = Transaction.new({
                                "account_holder_id" => accountholder4.id,
                                "merchant_id" => merchant4.id
                                "tag_id" => tag4.id,
                                "value" => 30
                                })

                                transaction1.save
                                transaction2.save
                                transaction3.save
                                transaction4.save

                                # transaction1.delete()
                                # transaction2.delete()
                                # transaction3.delete()
                                # transaction4.delete()
