# frozen_string_literal:true

# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer          not null
#  company_id :integer
#
# Indexes
#
#  index_people_on_city_id     (city_id)
#  index_people_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (company_id => companies.id)
#

class Person < ApplicationRecord
  belongs_to :city
  # Optional because people may be unemployed
  belongs_to :company, optional: true

  validates :name, presence: true
  validates :email,
            email_format: {
              message: 'does not appear to be a valid em-mail address'
            },
            presence: true
  validates :city, presence: true
end
