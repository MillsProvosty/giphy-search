require 'rails_helper'

describe GiphyService do
  describe "users" do
    it "finds results of 5 tigers" do
      tigers = GiphyService.new.tiger_info.take(5)
      tiger = tigers.first

      expect(tigers.count).to eq(5)

      expect(tiger[:name]).to eq("tiger-cat-black-and-white-Cr7AfrUbRatmo")
      expect(tiger[:url]).to eq("https://media0.giphy.com/media/Cr7AfrUbRatmo/200_s.gif?cid=7712b9e05d251a674c786d6b735d7ef8&rid=200_s.gif")
    end
  end
end
