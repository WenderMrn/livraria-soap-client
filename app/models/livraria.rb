class Livraria
	extend Savon::Model

	client wsdl: "http://localhost:8080/Livraria/LivrariaWS?wsdl"
	
	global :open_timeout, 30

	operations :listar_livros, :pesquisar_livro_por_codigo, :cadastrar_livro

	def cadastrar_livros(livro)
    super(message: livro).body[:cadastrar_livros_response][:return]
  end

  def listar_livros
    super().body[:listar_livros_response][:return]
  end

  def pesquisar_livro_por_codigo(codigo)
    super(message:{codigo: codigo}).body[:pesquisar_livro_por_codigo_response][:return]
  end

end