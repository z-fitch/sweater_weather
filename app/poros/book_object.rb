class BookObject
  attr_reader :isbn, :title

  def initialize(data)
    @isbn = check_isbn(data)
    @title = data[:title]
  end

  def check_isbn(data)
    if data[:isbn] == nil
      data[:isbn] = ["NA"]
    else
      data[:isbn]
    end
  end
end