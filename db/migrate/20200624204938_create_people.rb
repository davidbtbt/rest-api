# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email

      t.references :city, null: false, foreign_key: true
      t.references :company, null: true, foreign_key: true

      t.timestamps
    end
  end
end
