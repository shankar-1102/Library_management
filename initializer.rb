module Book
    attr_accessor :book_id, :book_name, :book_author, :book_status
    def initialize(book_id, book_name, book_author, book_status)
      @book_id = book_id
      @book_name = book_name
      @book_author = book_author
      @book_status = book_status
    end
    def to_s
        "Book ID: #{book_id}\n" 
        "Book Name: #{book_name}\n" 
        "Book Author: #{book_author}\n" 
        "Book Status: #{book_status}\n" 
    end
  end