class OpenLibraryService

  def self.get_books(location, quantity)
    get_url("search.json?q=#{location}&page=2&limit=#{quantity}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://openlibrary.org/") 
  end
end
