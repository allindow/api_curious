class IgPicService
  def initialize(id, token)
    @id           = id
    @connection   = Faraday.new("https://api.instagram.com/v1/media/")
    @connection.params["access_token"] = token
    @connection.params["client_id"] = ENV["INSTAGRAM_ID"]
  end

  def get_pic_data
    response = @connection.get "#{id}"
    parse(response.body)
  end

  def get_comments
    response = @connection.get "#{id}/comments"
    parse(response.body)
  end


  private
    def parse(response)
      JSON.parse(response, symbolize_names: true)
    end

    attr_reader :id
end
