require "rails_helper"

RSpec.describe Books do
  it "exists and has attributes" do
    city_state = "madison,wi"
    quantity = 5
    results = BooksFacade.search(city_state, quantity)

    expect(results.total_books_found).to be_an Integer
    expect(results.books.count).to eq(quantity)
    results.books.each do |book|
      expect(book).to have_key :isbn
      expect(book[:title]).to be_a String
      expect(book[:publisher]).to be_an Array
      expect(book).to_not have_key :type
      expect(book).to_not have_key :author_facet
    end
  end
end
