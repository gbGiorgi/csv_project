class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @people = Person.all
  end
end
