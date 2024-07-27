class ArticlesController < ApplicationController
  def index
    @articles = Article.order(:title)
  end
  def show
    @article = Article.find_by(id: params[:id])
  end
end
