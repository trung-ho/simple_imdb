require 'rails_helper'

RSpec.describe MovieCategory, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:movie) }
  end
end
