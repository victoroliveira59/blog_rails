class ArticlesController < ApplicationController
  def index
		@articles = Article.all #Quando o @ é inserido a minha variavel fica disponivel para ser lida pelo view
	end
	def show
		@article = Article.find(params[:id])
	end
	def new #A new ação instancia um novo artigo, mas não o salva. Este artigo será usado na visualização ao construir o formulário. Por padrão, a newação será renderizada app/views/articles/new.html.erb
		@article = Article.new
	end
	def create # A createação instancia um novo artigo com valores para o título e corpo e tenta salvá-lo. Se o artigo for salvo com sucesso, a ação redireciona o navegador para a página do artigo em "http://localhost:3000/articles/#{@article.id}". Caso contrário, a ação exibe novamente o formulário renderizando app/views/articles/new.html.erb com o código de status 422 Unprocessable Entity
		@article = Article.new(title: "...", body: "...")

		if @article.save
			redirect_to @article # redirect_to fará com que o navegador faça uma nova solicitação se ele salvar
		else
			render :new, status: :unprocessable_entity # enquanto render renderiza a visualização especificada para a solicitação atual.
		end
	end
end
