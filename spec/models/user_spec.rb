require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'input data' do
    let(:params) { { name: 'Tufoin', postcounter: 0 } }
    subject { User.new(params) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is valid postcounter >= 0' do
      subject.posts_counter = -2
      expect(subject).to be_invalid
    end

    it 'is present name valid' do
      subject.name = nil
      expect(subject).to be_invalid
    end

    it 'is valid title blank or not' do
      subject.name = ''
      expect(subject).to be_invalid
    end
  end

  describe 'Association' do
    it { should have_many(:posts) }
  end
end
