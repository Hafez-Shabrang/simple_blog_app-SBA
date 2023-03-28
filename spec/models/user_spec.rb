require 'rails_helper'

RSpec.describe User, type: :model do

  # Username testing
  it "valid username" do
    user = User.new(username: "User1", email: "user1@gmail.com", password: "123")
    expect(user).to be_valid
  end

  it "username must be present" do
    user = User.new(email: "user1@gmail.com", password: "123")
    expect(user).to_not be_valid
  end

  it "username can not be empty" do
    user = User.new(username: "", email: "user1@gmail.com", password: "123")
    expect(user).to_not be_valid
  end

  it "username must be between 3 and 15 charcters" do
    user = User.new(username: "", email: "user1@gmail.com", password: "123")
    user.username = "a" * 2
    expect(user).to_not be_valid
    user.username = "a" * 16
    expect(user).to_not be_valid
  end

  # Username testing
  it "valid email" do
    user = User.new(username: "User1", email: "user1@gmail.com", password: "123")
    expect(user).to be_valid
  end

  it "email must be present" do
    user = User.new(username: "User1", password: "123")
    expect(user).to_not be_valid
  end

  it "email can not be empty" do
    user = User.new(username: "", email: "", password: "123")
    expect(user).to_not be_valid
  end

  it "email must be between 12 and 30 characters" do
    user = User.new(username: "User1", email: "", password: "123")
    user.username = "a" * 11
    expect(user).to_not be_valid
    user.username = "a" * 31
    expect(user).to_not be_valid
  end
end
