class ArticlesController < ActionController::Base
  def new
    @article = Article.new
  end
end
