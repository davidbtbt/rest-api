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
require 'rails_helper'

RSpec.describe City, type: :model do

  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to allow_value('AZ').for(:state) }
  it { is_expected.to_not allow_value('a').for(:state) }
  it { is_expected.to_not allow_value('az').for(:state) }
  it { is_expected.to_not allow_value('xyz').for(:state) }


  it { is_expected.to have_many(:people) }
  it { is_expected.to have_many(:companies) }

end
