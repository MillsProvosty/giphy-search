class SearchFacade
  def initialize(query)
    @query = query
  end

  def limited_results
    params = {q: @query}
    fetch_data("/v1/gifs/search", params)[:data][0..4]
  end

  private
    def conn
      Faraday.new(url: "https://api.giphy.com") do |f|
        f.params["api_key"] = ENV["GIPHY_API_KEY"]
        f.adapter Faraday.default_adapter
      end
    end

    def fetch_data(url, params = nil)
      response = conn.get do |req|
        req.url url
        params.each do |key, value|
          req.params[key] = value
        end
      end
      JSON.parse(response.body, symbolize_names: true)
    end
end
