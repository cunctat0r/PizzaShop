#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

def parse_order order_string

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

post '/cart' do
	orders = params[:orders]
	orders_arr = parse_order orders	
	
  erb "Pizza #{orders_arr}"
end