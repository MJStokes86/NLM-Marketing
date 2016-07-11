require 'sinatra'
require 'rubygems'
require 'bundler/setup'

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'


get '/' do 
	erb :index
end

get '/overview' do
	erb :overview
end

get '/our-mission' do
	erb :mission
end

get '/customers' do
	erb :customers
end

get '/retail-support' do
	erb :retail
end

get '/contact-us' do
	erb :contact
end

post '/contact-us' do
	require 'pony'
	first_name  = params[:first_name]
	last_name = params[:last_name]
	mail = params[:mail]
	subject = params[:subject]
	body  = params[:body]




Pony.mail({
	:to => 'merchandising@nlm-marketing.com',
	:from => first_name + '<' + mail + '>',
	:reply_to => mail,
	:subject => subject,
	:body => body, 
	:via => :smtp,
	:via_options => {
		:address => 'smtp.zoho.com',
		:port => 465,
		:user_name => 'merchandising@nlm-marketing.com',
		:password => 'Nate0427',
		:authentication => :login,
		:ssl => true,
		:tls => true,
		:enable_starttls_auto => true
		
	}
	})






	redirect '/success'
end

get '/success' do 
	erb :success
end



