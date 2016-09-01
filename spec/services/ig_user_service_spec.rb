require 'rails_helper'

describe IgUserService do
  context "#user" do
    it "filters on parameters" do
      VCR.use_cassette("current_user_data") do
        user = IgUserService.new(ENV['IG_UID'], ENV['IG_USER_TOKEN']).get_user_data
        expect(user[:data][:username]).to eq("4ng3l4")
        expect(user[:data][:bio]).to eq("I'm a happy lady with a happy family and a happy life.")
        expect(user[:data][:full_name]).to eq("Angela Lindow")
      end
    end
  end
end
