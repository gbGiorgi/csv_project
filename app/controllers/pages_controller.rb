class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @people = Person.paginate(page: params[:page], per_page: 5)
  end
end
