# frozen_string_literal: true

# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string
#  state      :string(2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class City < ApplicationRecord

  # If you nuke the city, everything in it burns
  has_many :people, dependent: :destroy
  has_many :companies, dependent: :destroy

  validates :name, presence: true
  validates :state,
            presence: true,
            length: { is: 2 },
            format: {
              with: /[A-Z]+/,
              message: 'abbreviation should be 2 characters from A-Z'
            }

end
