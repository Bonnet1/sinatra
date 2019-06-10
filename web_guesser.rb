require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = 1 + rand(99)

get '/' do
    guess = params["guess"]
    message = check_guess(guess)
    erb :index, :locals => {:message => message}
end

def check_guess(guess)
	if guess.nil?
		return "Pick a number 1-100"
	else
		if guess.to_i > SECRET_NUMBER + 5 
	  		return "Whoa! Way Too High"
	    elsif guess.to_i < SECRET_NUMBER - 5 
	  		return "Yikes! Way Too Low"
	 	elsif guess.to_i > SECRET_NUMBER 
	  		return "That a bit too High" 
	  	elsif guess.to_i < SECRET_NUMBER 
	  		return "Too Low"
	    elsif  guess.to_i == SECRET_NUMBER 
	    	correct = true
	  		return "CONGRATS! You have guessed correctly!"
	  	end 
	end
end