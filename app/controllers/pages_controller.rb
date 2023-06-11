# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @people = filter_people
  end

  private

  def filter_people
    people = Person.all

    case params[:sort]
    when 'id'
      people = people.order(id: :asc)
    when 'name'
      people = people.order(name: :asc)
    when 'age'
      people = people.order(age: :asc)
    end

    people = people.where('name LIKE ?', "%#{params[:name_filter]}%") if params[:name_filter].present?
    people = people.where(age: params[:age_filter]) if params[:age_filter].present?

    people.paginate(page: params[:page], per_page: 5)
  end
end
