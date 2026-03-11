class QuotesClient
  API_KEY = ENV["QUOTES_API_KEY"]
  BASE_URL = "https://api.api-ninjas.com/v2/quotes"

  def connection 
    HTTParty.get("#{BASE_URL}/")
    
  end

end
