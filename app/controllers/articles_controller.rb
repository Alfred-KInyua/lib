# frozen_string_literal: true

class ArticlesController < ActionController::Base
  before_action :set_article, only:[:edit, :update, :show, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @art = Article.new
  end

  def edit
 
  end

  def create
    # render plain: params[:article].inspect
    @art = Article.new(art_params)
    if @art.save
      flash[:notice] = 'Your article was created successfully'
      redirect_to article_path(@art) # this is the show template
    else
      render :new

    end
  end

  def update

    if @art.update(art_params)
      flash[:success] = "The file was updated successfully."
      redirect_to article_path(@art)
    else
      render :edit
    end
  end

  def show
  
  end

  def destroy

    @art.destroy
    flash[:success] = 'The articles item was successfully destroyed.'
    redirect_to articles_path
  end
  

  private
  def set_article
    @art = Article.find(params[:id]) 
  end

  def art_params
    params.require(:article).permit(:title, :description)
  end
end
