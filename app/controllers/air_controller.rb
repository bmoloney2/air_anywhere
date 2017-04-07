class AirController < ApplicationController
  require 'httparty'

  def index
  	@max_value = "USD" + params[:user_input]
  	@org = params[:origin]
    @api_url = "https://www.googleapis.com/qpxExpress/v1/trips/search?key="+ ENV["AIR_ID"]
    @result = HTTParty.post(@api_url.to_str,
                            :body => {"request": {
                                        "slice": [{"kind": "qpxexpress#sliceInput",
                                                   "origin": @org,
                                                   "destination": "SFO",
                                                   "date": "2017-06-30"}],
                                        "passengers": {"kind": "qpxexpress#passengerCounts",
                                                       "adultCount": 1,},
                                        "refundable": "false",
                                      "maxPrice": @max_value,
                                      "solutions": 1}
                                      }.to_json,
                            :headers => { 'Content-Type' => 'application/json' } )

    byebug
   
  end


  private

  # def post_params
  #    params.require(:air).permit(:in)
  # end

end
