# frozen_string_literal: true

module V1
  class CitySerializer < ActiveModel::Serializer
    attributes :id, :name, :state # , :created_at, :updated_at
  end
end
