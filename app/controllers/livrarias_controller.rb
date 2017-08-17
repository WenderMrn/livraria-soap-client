class LivrariasController < ApplicationController
	
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
		@livro = @livraria.pesquisar_livro_por_codigo(params[:codigo])
	end

	def new
		
	end

	def create
		
	end

end
