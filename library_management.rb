require_relative 'ini'
class BooksManager
    include Book
    def initialize
      @books = []
    end
    def add_book(book_name, book_author, book_status)
      book = Book.new(@books.length + 1, book_name, book_author, book_status)
      @books << book
      puts 'book added successfully.'
    end
    def delete_book(name)
      book = find_book_by_name(name)
      if book
        @books.delete(book)
        puts 'book deleted successfully.'
      else
        puts 'book not found.'
      end
    end
    def change_status(name)
      book = find_book_by_name(name)
      if book
        new_status = ge_new_status_from_user
        update_book_status(book, new_status) unless new_status.empty?
        puts 'Status updated successfully.'
      else
        puts 'Book not found.'
      end
    end
    def ge_new_status_from_user
      puts 'Enter 1-Available 2-Not Available'
      status_number = gets.chomp.to_i
      case status_number
      when 1
        'Available'
      when 2
        'Not Available'
      else
        ''
      end
    end
    def update_book_status(book, new_status)
      book.book_status = new_status
    end
    def display_books
      if @books.empty?
        puts 'No books found.'
      else
        @books.each { |book| puts book }
      end
    end
    def display_available_books
      available_books = @books.select { |book| book.book_status.downcase == 'available' }
      if available_books.empty?
        puts 'No available books found.'
      else
        puts 'Available Books:'
        available_books.each { |book| puts book }
      end
      puts "Total Available Books: #{available_books.count}"
    end
    private
    def find_book_by_name(name)
      @books.find { |book| book.book_name.downcase == name.downcase }
    end
  end
  # Example usage
  books_manager = BooksManager.new
  def display_menu
    puts '---- Library Management ----'
    puts '1. Add Book'
    puts '2. Delete Book'
    puts '3. Change Book Status'
    puts '4. Display Books'
    puts '5. Display Available Books'
    puts '6. Exit'
  end
  def add_book_to_library(books_manager)
    book_name = ge_book_name
    book_author = ge_book_author
    book_status = ge_book_status
    books_manager.add_book(book_name, book_author, book_status)
  end
  def ge_book_name
    puts 'Enter Book Name'
    gets.chomp
  end
  def ge_book_author
    puts 'Enter Book Author'
    gets.chomp
  end
  def ge_book_status
    puts 'Enter 1 available : Enter 2 Not Available'
    entered_number = gets.chomp.to_i
    case entered_number
    when 1
      'Available'
    when 2
      'Not Available'
    else
      ge_book_status
    end
  end
  def delete_book(books_manager)
    puts 'Enter name of book to delete:'
    name = gets.chomp
    books_manager.delete_book(name)
  end
  def change_book_status(books_manager)
    puts 'Enter name of book to update status:'
    name = gets.chomp
    books_manager.change_status(name)
  end
  books_manager = BooksManager.new
  loop do
    display_menu
    print 'Enter your choice: '
    choice = gets.chomp.to_i
    case choice
    when 1
      add_book_to_library(books_manager)
    when 2
      delete_book(books_manager)
    when 3
      change_book_status(books_manager)
    when 4
      books_manager.display_books
    when 5
      books_manager.display_available_books
    when 6
      break
    else
      puts 'Invalid choice. Please try again.'
    end
    puts "\n"
  end