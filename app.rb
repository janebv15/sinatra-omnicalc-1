require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

#square
get("/square/new") do
  erb(:new_square_calc)
end

get "/square/results" do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2
  erb(:square_results)
end

#square root
get "/square_root/new" do
  erb(:square_root_calc)
end

get "/square_root/results" do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

#random numbers
get "/random/new" do
  erb(:random_calc)
end

get "/random/results" do
  @min_num = params.fetch("users_min_number").to_f
  @max_num = params.fetch("users_max_number").to_f

  @the_result = rand(@min_num..@max_num)
  erb(:random_results)
end

#payments
get "/payment/new" do
  erb(:payment_calc)
end

get "/payment/results" do
  @APR = params.fetch("user_apr").to_f
  @APR_monthly = @APR / 1200

  @years = params.fetch("user_years")
  @months = @years.to_i * 12

  @principal = params.fetch("user_pv")
  
  @numerator = @APR_monthly * @principal
  @denominator = 1 - (1 + @APR_monthly) ** -@months

  @the_result = @numerator / @denominator
  
  erb(:payment_results)
end
