require 'rails_helper'

RSpec.describe "Posts", type: :request do


  current_user = User.new(id: 1, username: "User1", email: "user1@gmail.com", password: "123", is_admin: true)
  current_user.save

  describe "GET /index" do
    it "return index page" do
      post = Post.new(id: 1, title: "title", content: "generate test content")
      post.user = current_user
      post.save
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "return show page" do
      post = Post.new(id: 1, title: "title", content: "generate test content")
      post.user = current_user
      post.save
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "return new page" do
      get new_post_url
      expect(response).to_not be_successful
    end
  end

  describe "GET /edit" do
    it "return new page" do
      post = Post.new(id: 1, title: "title", content: "generate test content")
      post.user = current_user
      post.save
      get edit_post_url(post)
      expect(response).to_not be_successful
    end
  end


end
