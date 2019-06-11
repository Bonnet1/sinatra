require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = 1 + rand(99)

get '/' do
    guess = params["guess"]
    message = check_guess(guess)
    bg_color = css_color message
    erb :index, :locals => {:bg_color => bg_color, :message => message}
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

def css_color(message)
	case message
		when "Pick a number 1-100" then "#FFFFFF"
		when "Whoa! Way Too High" then "#FF9473" 
		when "Yikes! Way Too Low"  then "#FF9473"
		when "That a bit too High" then "#FF9473"
		when "Too Low" then "#FF9473"
		when "Sorry, You lose this round!" then "red"
		when "CONGRATS! You have guessed correctly!" then "#62D99C"
	end
end