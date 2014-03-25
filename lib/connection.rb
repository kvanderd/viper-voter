class Connection

require "net/http"
require "uri"

 ENDPOINT = "https://congress.api.sunlightfoundation.com/"

  def initialize(endpoint = ENDPOINT)
    uri = URI.parse(endpoint) #create a class that can have different parameters of the url more easily accessible. example:
    # uri.scheme
	# => "https"
	# uri.port
	# => 80
	# uri.host
	# => "congress.api.sunlightfoundation.com"
    @http = Net::HTTP.new(uri.host, uri.port)
  end


  def get_congress(querry)
  	request = Net::HTTP::Get.new("#{ENDPOINT}#{querry}#{ENV[SECRET_TOKEN]}")
  	debugger
  end


  def get_request
  	response = @http.request(request)
  	ap response
  end


end