class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @people = if params[:sort] == "id"
                Person.order(id: :asc).paginate(page: params[:page], per_page: 5)
              elsif params[:sort] == "name"
                Person.order(name: :asc).paginate(page: params[:page], per_page: 5)
              elsif params[:sort] == "age"
                Person.order(age: :asc).paginate(page: params[:page], per_page: 5)
              else
                Person.paginate(page: params[:page], per_page: 5)
              end
  end
end
