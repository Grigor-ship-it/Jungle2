require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "returns false when name is blank" do     
      user = User.create({name: nil,email: "happy@gmail.com", password: "123456789", password_confirmation: "123456789"})     
      expect(user).to_not be_valid
      puts user.errors.full_messages
    end
    it "returns false when name is email" do     
      user = User.create({name: "Grigor Baltadjian",email: nil, password: "123456789",password_confirmation: "123456789"})     
      expect(user).to_not be_valid
      puts user.errors.full_messages
    end
    it "returns false when name is password and checks length" do     
      user = User.create({name: "Grigor Baltadjian",email: "happy@gmail.com", password: nil,password_confirmation: nil})     
      expect(user).to_not be_valid
      puts user.errors.full_messages
    end
    it "returns false when name is password doesnt match password_confirmation" do     
      user = User.create({name: "Grigor Baltadjian",email: "happy@gmail.com", password: "123456789", password_confirmation: "123456798"})     
      expect(user).to_not be_valid
      puts user.errors.full_messages
    end
    it "returns false when name is email already exists" do     
      user1 = User.create({name: "Grigor Baltadjian",email: "happy@gmail.com", password: "123456789", password_confirmation: "123456789"})
      user2 = User.create({name: "David Baltadjian",email: "happy@gmail.com", password: "123456789", password_confirmation: "123456789"})     
      expect(user2).to_not be_valid
      puts user2.errors.full_messages
    end
  end

  describe '.authenticate_with_credentials' do
    user1 = ({name: "Grigor Baltadjian",email: "Happy@gmail.com", password: "123456789", password_confirmation: "123456789"})
    
    user = User.find_by_email(("Happy@gmail.com").downcase)
    puts user.inspect
    it "should authenticate a person with case sensitive emails" do
    expect(user.authenticate_with_credentials("123456789")).to be_truthy
    end
    it "should authenticate a person with trailing white spaces" do
    expect(user.authenticate_with_credentials("      123456789     ")).to be_truthy
    end
  end
end
