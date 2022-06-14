class BooksSerializer
  def self.payload(results, current_forecast, location)
    {
      data: {
        id: "null",
        type: "books",
        attributes: {
          destination: location,
          forecast: {
            summary: current_forecast.conditions,
            temperature: "#{current_forecast.temperature.round} F"
          },
          total_books_found: results.total_books_found,
          books: [results.books]
        }
      }
    }
  end
end
