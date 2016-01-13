#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
	validates :name, presence: true
  	validates :phone, presence: true
  	validates :address, presence: true
end


get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

def parse_orders order_string

	s1 = order_string.split(',')	
	arr = []
	s1.each do |x|
		s2 = x.split('=')
		s3 = s2[0].split('_')
		id = s3[1]
		cnt = s2[1]
		arr2 = [id, cnt]
		arr.push arr2
	end

	return arr

end

before '/cart' do
	@products = Product.all
end

post '/cart' do
	@orders_input = params[:orders_input]
	@orders_arr = parse_orders @orders_input

	if @orders_arr.length == 0
		return erb :cart_is_empty
	end

	@orders_arr.each do |item|
		item[0] = @products.find(item[0])
	end		
  erb :cart
end

post '/place_order' do
  @order = Order.create params[:order]
  if @order.save 
  	erb :order_placed
  else
  	@error = @order.errors.full_messages.first  	
  end
end