class Books
  attr_reader :total_books_found, :books
  def initialize(unfiltered_json, quantity)
    @total_books_found = unfiltered_json[:numFound]
    @books =
      unfiltered_json[:docs][0..(quantity.to_i - 1)].map do |book|
        {
          isbn: book[:isbn],
          title: book[:title],
          publisher: book[:publisher]
        }
      end
  end
end
