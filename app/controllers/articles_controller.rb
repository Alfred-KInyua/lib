# frozen_string_literal: true

class ArticlesController < ActionController::Base
  def new
    @art = Article.new
  end
  def edit 
    @art = Article.find(params[:id])
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
    @art= Article.find(params[:id])
   if @art.update(art_params)
    flash[:notice] ='File updated successfully'
    redirect_to article_path(@art)
   else
 render :edit
   end
  end
  def show
    @art = Article.find(params[:id])
  end

  private

  def art_params
    params.require(:article).permit(:title, :description)
  end
end
