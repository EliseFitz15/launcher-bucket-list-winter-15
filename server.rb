require "sinatra"
require "csv"
require "pry"


get "/launcher-bucket-list" do
  @goals = CSV.readlines("bucket_list.csv", headers: true)
  erb :index
end

get "/" do
  redirect "/launcher-bucket-list"
end

post "/launcher-bucket-list" do
  goal = params["goal"]

  unless goal.strip.empty?
    CSV.open("bucket_list.csv", "a") do |file|
      file << [goal]
    end
  end
  redirect "/launcher-bucket-list"
end
