require 'sinatra'
if development?
  require 'sinatra/reloader'
end

def caesar_cipher(string, number)
	return string.chars.map {|c|
		(number%26).times{c.next!} if c.ord.between?(65, 90) || c.ord.between?(97, 122)
		c[-1]
	}.join("")
end

get '/' do
  message = params['message'].to_s
  code = params['code'].to_i
  encoded_message = caesar_cipher(message, code)
  erb :index, :locals => { :message => message, :code => code, :encoded_message => encoded_message }
end

