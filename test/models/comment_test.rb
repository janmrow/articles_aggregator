require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @article = articles(:one)
    @comment = @article.comments.create(author: "Tim", body: "Just a test.")
  end

  test "correct comment should be saved" do
    assert @comment.valid?
  end

  test "should not save comment without author" do
    @comment.author = ""
    assert_not @comment.valid?
  end

  test "should not save comment without body" do
    @comment.body = ""
    assert_not @comment.valid?
  end

  test "author should have minimum 3 chars" do
    @comment.author = "a"*2
    assert_not @comment.valid?
  end

  test "body should have minimum 5 chars" do
    @comment.body = "a"*4
    assert_not @comment.valid?
  end

end
