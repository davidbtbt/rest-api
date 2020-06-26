# frozen_string_literal: true

module V1
  class PeopleController < BaseController
    def index
      people = Person.all
      paginate json: people
    end

    def show
      person = Person.find(person_id)
      render json: person
    end

    protected

    def person_id
      params[:id]
    end
  end
end

