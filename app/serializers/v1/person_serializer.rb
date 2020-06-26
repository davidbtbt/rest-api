# frozen_string_literal: true

module V1
  class PersonSerializer < ActiveModel::Serializer
    attributes :id, :name, :email # , :created_at, :updated_at

    has_one :company
    has_one :city
  end
end
