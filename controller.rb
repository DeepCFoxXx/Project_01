require('sinatra')
require('sinatra/reloader')
require('pry')

require_relative('./models/transaction.rb')
require_relative('./models/merchant.rb')
require_relative('./models/tag.rb')

get '/' do
  erb( :home )
end

get '/transactions/total' do
  @value = Transaction.total_value()
  erb( :total )
end

get '/transactions' do
  @transactions = Transaction.all()
  erb( :index )
end

get '/transactions/new' do
  @merchants = Merchant.all
  @tags = Tag.all
  erb( :new )
end

get '/transactions/:id' do
  @transaction = Transaction.find( params[:id] )
  erb( :show )
end

post '/transactions' do
  @transaction = Transaction.new( params )
  @transaction.save()
  redirect to "/transactions"
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find( params[:id] )
  erb( :edit )
end

put '/transactions/:id' do
  Transaction.new( params ).update
  redirect to '/transactions'
end

delete '/transactions/:id' do
  transaction = Transaction.find( params[:id] )
  transaction.delete()
  redirect to '/transactions'
end
