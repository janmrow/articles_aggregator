class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "admin", except: [ :index, :show ]
  
  def index
    # @articles = Article.order("created_at DESC")
    # @articles.paginate(page: params[:page], per_page: 5)
    @articles = Article.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
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

end
