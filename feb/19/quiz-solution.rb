require 'pry'
require 'httparty'

class ApiInteractorThingamajig
  include HTTParty
  base_uri "https://frozen-springs-1650.herokuapp.com"

  def get_user_count_sum
    # Needs to GET /
    # Could do ApiInteractorThingamajig instead of self.class ...
    response = self.class.get "/"

    # Or something like `response.map { |e| e["number"] }.reduce :+`
    total = 0
    response.each do |entry|
      total += entry["number"]
    end
    total
  end

  def send_my_number number
    self.class.post("/add",
      query:   { number: number },
      headers: { "Authorization" => "jcd" }
    )
  end
end

ait = ApiInteractorThingamajig.new
current_sum = ait.get_user_count_sum
ait.send_my_number current_sum
