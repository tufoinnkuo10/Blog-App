require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'input data' do
    before(:each) do
      @user = User.create(name: 'Tufoin', bio: 'Tufoins info', postcounter: 0)
    end
    subject { @user.posts.new(title: 'Big', text: 'Small', commentscounter: 0, likescounter: 0) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is valid commentscounter >= 0' do
      subject.commentscounter = -2
      expect(subject).to be_invalid
    end

    it 'is valid title present' do
      subject.title = nil
      expect(subject).to be_invalid
    end

    it 'is valid title blank or not' do
      subject.title = ''
      expect(subject).to be_invalid
    end

    it 'should count the number of comments' do
      subject.commentscounter = 15
      expect(subject.commentscounter).to eq(15)
    end

    it 'should count the number of likes' do
      subject.likescounter = 10
      expect(subject.likescounter).to eq(10)
    end
  end

  describe 'Association' do
    it { should belong_to(:user).without_validating_presence }
  end
end
