class BooksFacade

  def self.book_results(location, quantity)
    json = OpenLibraryService.get_books(location, quantity)
    json[:docs].map do |book|
      BookObject.new(book)
    end
  end

  def self.book_count(location, quantity)
    json = OpenLibraryService.get_books(location, quantity)
    json[:num_found]
  end

end