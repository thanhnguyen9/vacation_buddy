class LocationsController < ApplicationController

  def show
    conn = Faraday.new
    input = params[:search].split(' ').join('-')
    location = conn.get("http://api.songkick.com/api/3.0/search/locations.json?query=#{input}&apikey=v9PDhUduRjdj3Iui")
    location_info = JSON.parse(location.body)
    city = location_info["resultsPage"]["results"]["location"].first["city"]
    weather = conn.get("https://api.forecast.io/forecast/#{ENV['FORECAST_APP_KEY']}/#{city["lat"]},#{city["lng"]}")
    @forecast = JSON.parse(weather.body)
  end
end
