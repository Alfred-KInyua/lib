# frozen_string_literal: true

class ArticlesController < ActionController::Base
  def new
    @art = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @art = Article.new(art_params)
    if @art.save
      flash[:notice] = 'Your article was saved successfully'
      redirect_to article_path(@art)
    else
      flash[:notice] = 'Your articles was not saved'
      render :new
    end
  end

  private

  def art_params
    params.require(:article).permit(:title, :description)
  end
end
