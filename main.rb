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

Pony.options = {
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :location 			  => '/c/sendmail/./sendmail',
    :ssl 				  => true,
    :arguments			  => '-t',
    :port                 => '465',
    # :enable_starttls_auto => true,
    :user_name            => 'stokes8671@gmail.com',
    :password             => "mjs242630135",
    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain               => "localhost",
    # :tls				  => true
  }
}


	Pony.mail(
		:to => 'stokes8671@gmail.com', 
		:from => first_name + '<' + mail + '>',
		:reply_to => mail,
		:subject => subject,
		:body => body)
		
	

	redirect '/success'
end

get '/success' do 
	erb :success
end



