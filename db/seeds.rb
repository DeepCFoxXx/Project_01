require_relative('../models/merchant.rb')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require ('pry')

# Merchant.delete_all()
# Tag.delete_all()
# Transaction.delete_all()

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

        tag1 = Tag.new ({
          "name" => "Business"
          })

          tag2 = Tag.new ({
            "name" => "Personal"
            })

            tag3 = Tag.new ({
              "name" => "Private"
              })

              tag4 = Tag.new ({
                "name" => "Monthly"
                })

                tag1.save
                tag2.save
                tag3.save
                tag4.save

                transaction1 = Transaction.new ({

                  "merchant_id" => merchant1.id,
                  "tag_id" => tag1.id,
                  "value" => 20
                  })

                  transaction2 = Transaction.new ({

                    "merchant_id" => merchant2.id,
                    "tag_id" => tag2.id,
                    "value" => 15
                    })

                    transaction3 = Transaction.new ({

                      "merchant_id" => merchant3.id,
                      "tag_id" => tag3.id,
                      "value" => 50
                      })

                      transaction4 = Transaction.new ({

                        "merchant_id" => merchant4.id,
                        "tag_id" => tag4.id,
                        "value" => 30
                        })

                        transaction5 = Transaction.new ({

                          "merchant_id" => merchant4.id,
                          "tag_id" => tag4.id,
                          "value" => 30
                          })

                        transaction1.save
                        transaction2.save
                        transaction3.save
                        transaction4.save
                        transaction5.save

                        binding.pry
                        nil
