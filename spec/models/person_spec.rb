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
require 'rails_helper'

RSpec.describe Person, type: :model do
  it { is_expected.to belong_to(:city) }
  it { is_expected.to validate_presence_of(:city) }

  # not expected because is not required
  it { is_expected.to_not belong_to(:company) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }

  it { is_expected.to allow_value('test@example.com').for(:email) }
  it { is_expected.to_not allow_value('bad_email_dot_com').for(:email) }

end
