class ArticlesController < ApplicationController

  USERS = { "admin" => "admin" }

  before_action :authenticate, except: [ :index, :show ]
  def index
    @articles = Article.all.reverse
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update 
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end

end
