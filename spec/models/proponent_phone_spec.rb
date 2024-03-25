# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProponentPhone, type: :model do
  let(:proponent) { create(:proponent) }

  describe 'associations' do
    it { should belong_to(:proponent) }
  end

  describe 'validations' do
    subject { build(:proponent_phone, proponent:) }
    it { should validate_presence_of(:phone_number) }
  end
end
