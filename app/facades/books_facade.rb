class BooksFacade


  def self.book_results(location, quantity)
    json = OpenLibraryService.get_books(location, quantity)
    BookObject.new(json[:docs])
  end

  def self.book_count(location, quantity)
    json = OpenLibraryService.get_books(location, quantity)
    json[:num_found]
  end

end