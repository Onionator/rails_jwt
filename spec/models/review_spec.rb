require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to(:destination) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :text_body }
end
