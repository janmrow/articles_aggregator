require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  test "should get home page and render correct template" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:articles)
    assert_select 'title', "Crud App"
  end

  test "should get new and render correct template" do
    get :new
    assert_response :success
    assert_template :new
    assert_select 'h2', "Add new article"
  end

  test "edit should render correct template" do
    get :edit, id: articles(:one)
    assert_response :success
    assert_template :edit
    assert_select 'h2', "Edit article"

  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: {title: "Test", body: "Test article."}
    end
    assert_redirected_to article_path(assigns(:article))
  end

  test "should delete article" do
    assert_difference ['Article.count'], -1 do
      delete :destroy, id: articles(:one)
    end
  end

end
