class LivrosController < ApplicationController
	
	def initialize
		super	
		@livraria = Livraria.new
		# imprimindo operações disponíveis
		puts @livraria.client.operations
	end

	def index
		@livros = @livraria.listar_livros
	end

	def show
		@livro = @livraria.procurar_por_id(params[:id])
	end

	def new
		@livro = Livro.new
	end

	def edit
		@livro = @livraria.procurar_por_id(params[:id])
	end

	def create
    if @livraria.cadastrar_livro(livro_params)
      flash.now[:notice] = "O livro #{@livro.titulo.upcase} foi adicionado com sucesso."
      @livro = Livro.new
      render "new"
    end
	end

	def update
		if @livraria.atualizar_livro(livro_params)
      redirect_to livros_path
    end
	end

	def destroy
    if not @livraria.excluir_livro(params[:id]).nil?
      redirect_to livros_path
    end
	end

	def search
    @livros = @livraria.pesquisar_por_isbn(params[:isbn])
	end

	private
    def livro_params
      @livro = Livro.new params.require(:livro).permit(:id, :codigo,:titulo, :editora, :isbn, :edicao, :autor)
    end

end
