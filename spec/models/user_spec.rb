require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before :each do

      @user = User.create(
        email:                  'a@b.c',
        name:                   'Janet',
        last_name:              'Billings',
        password:               'asdfasdf',
        password_confirmation:  'asdfasdf'
      )
    end

    it "is not valid without a name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without a last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is not valid with existing email" do
      @user = User.create(
        email:                  'a@b.c',
        name:                   'Janet',
        last_name:              'Billings',
        password:               'asdfasdf',
        password_confirmation:  'asdfasdf'
      )
      expect(@user).to_not be_valid
    end

    it "is valid with a new email" do
      user1 = User.create(
        email:                  'a@bv.c',
        name:                   'Jarnet',
        last_name:              'Ballings',
        password:               'asdfaasdf',
        password_confirmation:  'asdfaasdf'
      )
      user2 = User.create(
        email:                  'a@bv.c',
        name:                   'Jarnet',
        last_name:              'Ballings',
        password:               'asdfaasdf',
        password_confirmation:  'asdfaasdf'
      )
      expect(user2).to_not be_valid
    end

    it "is not valid without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "is not valid without password matching" do
      expect(@user.password_confirmation).to eq(@user.password)
    end

    it "is not valid with passwords mismatched" do
      @user.password_confirmation = 'thisisnotyourpassword'
      expect(@user.password_confirmation).not_to eq(@user.password)
    end

    it "is long enough password" do
      expect(@user).to be_valid
    end

    it "is long enough password" do
      @user.password = 'a'
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before :each do

      @user = User.create(
        email:                  'a@b.c',
        name:                   'Janet',
        last_name:              'Billings',
        password:               'asdfasdf',
        password_confirmation:  'asdfasdf'
      )
    end

    it "is not valid without an email" do
      expect(User.authenticate_with_credentials('', 'asdfasdf')).to be_nil
    end

    it "is not valid without a password" do
      expect(User.authenticate_with_credentials('a@b.c', '')).to be_nil
    end

    it "is is valid with username and password" do
      expect(User.authenticate_with_credentials('a@b.c', 'asdfasdf')).to eq @user
    end

  end
end
