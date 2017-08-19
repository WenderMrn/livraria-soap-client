class Livro
	include ActiveModel::Model
	#código, título, editora, ISBN, edição, autor
	attr_accessor :id, :codigo, :titulo, :editora, :isbn, :edicao, :autor
end
