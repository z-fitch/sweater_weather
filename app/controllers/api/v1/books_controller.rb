class Api::V1::BooksController < ApplicationController
  def search 
    begin
      @books = BooksFacade.book_results(params[:location], Book.correct_quantity(params[:quantity]))
      @book_count = BooksFacade.book_count(params[:location], Book.correct_quantity(params[:quantity]))
      @current = ForecastFacade.current_weather_forecast(MapFacade.get_location(params[:location]))
      render json: BookSerializer.book_data(@books, @book_count, @current, params[:location])
    rescue StandardError => e
      render json: ErrorSerializer.format_errors(e.message), status: 404
    end
  end
end