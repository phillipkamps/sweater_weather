class BooksSerializer
  def self.payload(results, current_forecast, location)
    {
      data: {
        id: "null",
        type: "books",
        attributes: {
          destination: location,
          forecast: {
            summary: current_forecast[:weather][0][:description],
            temperature: "#{current_forecast[:temp].round} F"
          },
          total_books_found: results.total_books_found,
          books: [results.books]
        }
      }
    }
  end
end
