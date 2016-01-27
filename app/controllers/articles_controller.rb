class ArticlesController < ApplicationController

  #GET /articles
  def index
    #Todos los registros de la tabala que correspoonde a ése modelo
    @articles = Article.all
  end
  #GET /articles/:id
  def show
    #find va a encontrar un resgistro por su "id"
    @article = Article.find(params[:id])
  end
  #GET /articles/new
  def new
    @article = Article.new
  end
  def edit
    @article = Article.find(params[:id])
  end
  #POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  private
  def article_params
    params.require(:article).permit(:title,:body)
  end
end
