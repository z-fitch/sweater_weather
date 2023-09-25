class Book
  attr_reader :isbn, :title

  def initialize(data)
    @isbn = data[:isbn]
    @title = data[:title]
  end
end