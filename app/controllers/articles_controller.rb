class ArticlesController < ApplicationController
  def index
  	@articles=Article.all.order("created_at desc")
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end
  
  def create
  	@article = Article.new(article_params)
  	if @article.save
  		redirect_to articles_path, notice: 'Article was succeddfully saved.'
  	else
  		render :new
  	  end
  end

  	def edit
  		@article = Article.find(params[:id])
    end

	def update
	  	@article = Article.find(params[:id])
	  	if @article.update(article_params)
	  		redirect_to articles_path, notice: 'Article was succeddfully updated.'
	  	else
	  		render :edit
	  	end
	end

	def destroy
  		@article = Article.find(params[:id])
  		if @article.destroy
  			redirect_to articles_path, notice: 'Article was succeddfully deleted.'
  	  	end
	end
	  private
	  def article_params
	  	params.required(:article).permit(:title,:body)
	  end
end