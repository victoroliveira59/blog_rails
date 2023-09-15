class ArticlesController < ApplicationController
  def index
		@articles = Article.all #Quando o @ é inserido a minha variavel fica disponivel para ser lida pelo view
  end
end
