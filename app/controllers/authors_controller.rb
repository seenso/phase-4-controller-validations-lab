class AuthorsController < ApplicationController
  
  def show
    author = Author.find(params[:id])
    render json: author
  end

  def create
    author = Author.create!(author_params)
    render json: author, status: :created
    # send back err messages if the new author is invalid
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end
  
end
