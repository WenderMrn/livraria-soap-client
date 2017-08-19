class Livraria
	extend Savon::Model

	client wsdl: "http://localhost:8080/Livraria/LivrariaWS?wsdl"
	
	global :open_timeout, 30

	operations :listar_livros, :procurar_por_isbn, :procurar_por_id,:pesquisar_por_isbn,
             :cadastrar_livro, :excluir_livro, :atualizar_livro           

	def cadastrar_livro(livro)
    puts "livro aqui#{livro.to_json}"
    super(message:livro_to_hash(livro)).body[:cadastrar_livro_response][:return]
  end

  def listar_livros
    @livros = super().body[:listar_livros_response][:return]
    puts "AQUI: #{@livros.class}"
    if @livros.is_a?(Array)
      @livros
    elsif not @livros.nil?
      @livros = Array.new <<  @livros
    else
      @livros = Array.new
    end
  end

  def procurar_por_isbn(isbn)
    Livro.new(super(message:{isbn: isbn}).body[:procurar_por_isbn_response][:return])
  end

  def pesquisar_por_isbn(isbn)
    @livros = super(message:{isbn: isbn}).body[:pesquisar_por_isbn_response][:return]
    if @livros.is_a?(Array)
      @livros.to_json
    elsif not @livros.nil?
      @livros = Array.new << @livros
      @livros.to_json  
    else
      Array.new.to_json
    end
  end

  def procurar_por_id(id)
    Livro.new(super(message:{id: id}).body[:procurar_por_id_response][:return])
  end

  def excluir_livro(id)
    Livro.new(super(message:{id: id}).body[:excluir_livro_response][:return])
  end

  def atualizar_livro(livro)
    super(message:livro_to_hash(livro)).body[:atualizar_livro_response][:return]
  end

  private
    def livro_to_hash(livro)    
      {
        livro: {
          id:      (not livro.id.nil? ) ? livro.id.to_i : 0, 
          codigo:  livro.codigo,
          titulo:  livro.titulo.upcase,
          editora: livro.editora,
          isbn:    livro.isbn,  
          edicao:  livro.edicao, 
          autor:   livro.autor
        }
      }
    end

end