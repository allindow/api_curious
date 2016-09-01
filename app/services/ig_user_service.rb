class IgUserService
  def initialize(uid, token)
    @uid = uid
    @connection   = Faraday.new("https://api.instagram.com/v1/users/")
    @connection.params["access_token"] = token
    @connection.params["client_id"] = ENV["INSTAGRAM_ID"]
  end


  def get_user_pics
    response = @connection.get "self/media/recent"
    parse(response.body)
  end

  def get_user_data
    response = @connection.get "#{uid}"
    parse(response.body)
  end

  private
    def parse(response)
      JSON.parse(response, symbolize_names: true)
    end

    attr_reader :uid
end
