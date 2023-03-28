require 'rails_helper'

RSpec.describe "Users", type: :request do

  current_user = User.new(id: 1, username: "User1", email: "user1@gmail.com", password: "123", is_admin: true)
  current_user.save

  describe "GET /index" do
    it "return index page" do
      get users_url
      expect(response).to_not be_successful
    end
  end

  describe "GET /show" do
    it "return show page" do
      get user_url(current_user)
      expect(response).to_not be_successful
    end
  end

  describe "GET /new" do
    it "return new page" do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "return new page" do
      get edit_user_url(current_user)
      expect(response).to_not be_successful
    end
  end



end
