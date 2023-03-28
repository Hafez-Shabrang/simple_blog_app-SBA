require 'rails_helper'

RSpec.describe Comment, type: :model do

  # Body testing
  it "comment must be present" do
    comment = Comment.new()
    expect(comment).to_not be_valid
  end

  it "comment can not be empty" do
    comment = Comment.new(body: "")
    expect(comment).to_not be_valid
  end
  
end
