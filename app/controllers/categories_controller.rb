class CategoriesController < ApplicationController
  def show
    @categories = @event.categories
  end

end
