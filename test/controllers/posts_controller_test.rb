require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should create article" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { title: "title", content: "generate test content" } }
    end
    assert_redirected_to post_url(Post.last)
  end

end
