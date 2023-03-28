require 'rails_helper'

RSpec.describe Comment, type: :model do

  # Body testing
  it "valid comment" do
    user = User.new(id: 2, username: "User2", email: "user2@gmail.com", password: "123")
    user.save
    post = Post.new(id: 1, title: "title", content: "generate test content", user_id: user.id)
    post.save
    user.post_id = post.id
    comment = Comment.new(body: "test comment", user_id: user.id, post_id: post.id)
    expect(comment).to be_valid
  end

  it "comment must be present" do
    comment = Comment.new()
    expect(comment).to_not be_valid
  end

  it "comment can not be empty" do
    comment = Comment.new(body: "")
    expect(comment).to_not be_valid
  end

end
