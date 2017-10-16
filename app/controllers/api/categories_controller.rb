class Api::CategoriesController < ApplicationController
  def index
    render status: 200, json: {
      categories: Category.all
    }.to_json
  end

  def show
   category = Category.find(params[:id])

   render status: 200, json: {
     category: category
   }.to_json
 end

end
