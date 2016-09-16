require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:strava_id) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }
end