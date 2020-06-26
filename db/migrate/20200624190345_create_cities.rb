# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state, limit: 2

      t.timestamps
    end
  end
end
