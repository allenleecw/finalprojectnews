class NewsController < ApplicationController

  def index
    @companies = [] #to find the company name using current user id
    current_user.favcompany_ids.each do |i|
      @companies << Favcompany.find_by(id: i).name
    end
    @num = 0 #for display of company names
    @positive = 0 #for pie chart
    @negative = 0
    @array = [] #for the news and search api
    @line = {} #combined positive & negative
    @positiveline = {} #positive news hash
    @negativeline = {} #negative news hash

    @companies.each do |ele|
      require 'net/http'
      uri = URI('https://api.cognitive.microsoft.com/bing/v5.0/news/search')
      uri.query = URI.encode_www_form({
                                        'q' => ele,
                                        'count' => '100',
                                        'offset' => '0',
                                        'mkt' => 'en-my',
                                        'safeSearch' => 'Moderate',
                                        'sortby'=> 'date'
      })

      request = Net::HTTP::Get.new(uri.request_uri)
      request['Ocp-Apim-Subscription-Key'] = ENV["bing_key"]
      request.body = "{body}"
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
      end
      @first = response.body
      @second = JSON.parse(@first)
      @array << @second
      if params[:number].nil?
        @number = 5
      else
        @number = params[:number].to_i
      end
    end
  end

  def chart
    index
  end
end
