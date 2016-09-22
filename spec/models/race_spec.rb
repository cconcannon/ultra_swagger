require 'rails_helper'

describe Race do
  it { should validate_presence_of :name }
  it { should validate_presence_of :location }
  it { should validate_presence_of :date }
  it { should validate_presence_of :lat }
  it { should validate_presence_of :lon }
  it { should validate_presence_of :climate }
  it { should validate_presence_of :temp_high }
  it { should validate_presence_of :temp_low }
end
    