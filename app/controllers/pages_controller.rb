class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @people = filter_people
  end

  private

  def filter_people
    people = Person.all

    if params[:sort] == "id"
      people = people.order(id: :asc)
    elsif params[:sort] == "name"
      people = people.order(name: :asc)
    elsif params[:sort] == "age"
      people = people.order(age: :asc)
    end

    people = people.where("name LIKE ?", "%#{params[:name_filter]}%") if params[:name_filter].present?
    people = people.where(age: params[:age_filter]) if params[:age_filter].present?

    people.paginate(page: params[:page], per_page: 5)
  end
end
