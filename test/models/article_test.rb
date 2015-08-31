require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article = articles(:one)
  end

  test "correct article should be saved" do
    assert @article.valid?
  end

  test "should not save article without tile" do
    @article.title = ""
    assert_not @article.valid?
  end

  test "should not save article without body" do
    @article.body = ""
    assert_not @article.valid?
  end

  test "title should have minimum 3 chars" do
    @article.title = "a"*2
    assert_not @article.valid?
  end

  test "body should have minimum 10 chars" do
    @article.body = "a"*9
    assert_not @article.valid?
  end

end
