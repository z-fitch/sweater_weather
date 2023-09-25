class BookSerializer

  def self.book_data(books, book_count, current, location)
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": location,
          "forecast": {
            "summary": current.condition,
            "temperature": "#{current.temperature} F"
          },
          "total_books_found": book_count,
          "books": books.map do |book|
            {
              "isbn": book.isbn.map do |i|
                  i
              end,
              "title": book.title
            }
          end
        }
      }
    }
  end
end