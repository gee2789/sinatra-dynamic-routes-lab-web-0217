require_relative 'config/environment'

class App < Sinatra::Base

  get "/reversename/:name" do
    @user_name = params[:name]
    @user_name.reverse
  end

  get "/square/:number" do
    number = params[:number]
    square = number.to_i*number.to_i
    square.to_s
  end

  get "/say/:number/:phrase" do
    @phrase = params[:phrase]
    @number = params[:number]
    "#{@phrase}\n" * @number.to_i
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end


  get "/*/:number1/:number2" do
    operations = params['splat'].join
    case operations
    when "add"
      "#{params[:number1].to_i + params[:number2].to_i}"
    when "subtract"
      "#{params[:number1].to_i - params[:number2].to_i}"
    when "multiply"
      "#{params[:number1].to_i * params[:number2].to_i}"
    else
      "#{params[:number1].to_i / params[:number2].to_i}"
    end
  end

end
