class AuthorsController < ApplicationController

  def index
    @authors = Author.active.order('name asc').
      paginate(page: params[:page], per_page: 20)
  end
end
