require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  test "should create comment and redirect to article" do
    article = articles(:one)
    author = "Jim"
    body = "This is a comment."

    patch :create, article_id: article.id, comment: { author: author, body: body }
    assert_equal assigns(:comment).author, author
    assert_equal assigns(:comment).body, body
    assert_redirected_to article_path(article)
  end

  test "should delete comment and redirect to article" do
    article = articles(:one)
    comment = article.comments.create(author: "Tom", body: "Test comment.")
    delete :destroy, article_id: article.id, id: comment.id

    assert_equal article.comments.exists?(comment.id), false
    assert_redirected_to article_path(article)
  end
end
