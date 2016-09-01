require 'rails_helper'

describe IgPicService do
  context "#pic" do
    it "filters on parameters" do
      VCR.use_cassette("instagram_pic") do
        low_res = "https://scontent.cdninstagram.com/t51.2885-15/s320x320/e35/13260786_1225197347499881_2075790074_n.jpg?ig_cache_key=MTI1NjIyMDQzNjA3OTg3ODA2MQ%3D%3D.2"
        standard = "https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/13260786_1225197347499881_2075790074_n.jpg?ig_cache_key=MTI1NjIyMDQzNjA3OTg3ODA2MQ%3D%3D.2"
        pic = IgPicService.new("1256220436079878061_28612086", ENV['IG_USER_TOKEN']).get_pic_data
        expect(pic[:data][:images].count).to eq(3)
        expect(pic[:data][:likes][:count]).to eq(19)
        expect(pic[:data][:images][:low_resolution][:url]).to eq(low_res)
        expect(pic[:data][:images][:standard_resolution][:url]).to eq(standard)
      end
    end
  end
end
