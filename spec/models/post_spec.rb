require 'rails_helper'

RSpec.describe Post, type: :model do


  # Title testing
  it "valid title" do
    current_user = User.new(id: 1, username: "User1", email: "user1@gmail.com", password: "123")
    current_user.save
    post = Post.new(title: "title", content: "generate test content", user_id: current_user.id)
    expect(post).to be_valid
  end

  it "title must be present" do
    post = Post.new(content: "generate test content")
    expect(post).to_not be_valid
  end

  it "title can not be empty" do
    post = Post.new(title: "", content: "generate test content")
    expect(post).to_not be_valid
  end

  it "title must be at between 4 and 20 characters" do
    post = Post.new(title: "", content: "generate test content")
    post.title = "a" * 3
    expect(post).to_not be_valid
    post.title = "a" * 21
    expect(post).to_not be_valid
  end

  # Content testing
  it "valid content" do
    current_user = User.new(id: 1, username: "User1", email: "user1@gmail.com", password: "123")
    current_user.save
    post = Post.new(title: "title", content: "generate test content", user_id: current_user.id)
    expect(post).to be_valid
  end

  it "content must be present" do
    post = Post.new(title: "title")
    expect(post).to_not be_valid
  end

  it "content can not be empty" do
    post = Post.new(title: "title", content: "")
    expect(post).to_not be_valid
  end

  it "content must be at least 10 characters" do
    post = Post.new(title: "title", content: "")
    post.content = "a" * 9
    expect(post).to_not be_valid
  end

end
