require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  test "should get home page, render correct template" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:articles)
    assert_select 'title', "Crud App"
  end

  test "should get new and render correct template" do
    authenticate_with_http_basic
    get :new
    assert_response :success
    assert_template :new
    assert_select 'h2', "Add new article"
  end

  test "edit should render correct template" do
    authenticate_with_http_basic
    get :edit, id: articles(:one)
    assert_response :success
    assert_template :edit
    assert_select 'h2', "Edit article"

  end

  test "should create article and redirect to article path" do
    authenticate_with_http_basic
    assert_difference('Article.count') do
      post :create, article: { title: "Test", body: "Test article." }
    end
    assert_redirected_to article_path(assigns(:article))
  end

  test "should delete article and redirect to root" do
    authenticate_with_http_basic
    assert_difference ['Article.count'], -1 do
      delete :destroy, id: articles(:one).id
      assert_redirected_to root_path
    end
  end

  test "should update article and redirect to article path" do
    authenticate_with_http_basic
    article = articles(:one)
    new_title = "This is new title"
    new_body = "And this is new body"

    patch :update, id: article.id, article: { title: new_title, body: new_body }

    assert_equal assigns(:article).title, new_title
    assert_equal assigns(:article).body, new_body
    assert_redirected_to article_path(assigns(:article))
  end

end
