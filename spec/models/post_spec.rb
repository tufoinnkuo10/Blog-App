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
      subject.comments_counter = -2
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

    it 'should be able to save posts' do
      expect(subject.save).to eq(true)
    end

    it 'should count the number of comments' do
      subject.comments_counter = 15
      expect(subject.comments_counter).to eq(15)
    end

    it 'should count the number of likes' do
      subject.likes_counter = 10
      expect(subject.likes_counter).to eq(10)
    end
  end

  describe 'Association' do
    it { should belong_to(:user).without_validating_presence }
  end
end
