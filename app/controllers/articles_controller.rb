# frozen_string_literal: true

class ArticlesController < ActionController::Base
  def new
    @art = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @art = Article.new(art_params)
    @art.save
    redirect_to article_path(@art)
  end

  private

  def art_params
    params.require(:article).permit(:title, :description)
  end
end
