# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer          not null
#
# Indexes
#
#  index_companies_on_city_id  (city_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#

class Company < ApplicationRecord

  belongs_to :city
  # If the company caves down, keep the people alive
  has_many :people, dependent: :delete_all

  validates :name, presence: true
  validates :city, presence: true
end
