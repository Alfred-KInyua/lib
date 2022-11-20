class ArticlesController < ActionController::Base
  def index
    @articles = Article.all
  end

  def new
    @articles = Article.all
  end
end
