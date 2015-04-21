require 'rails_helper'

RSpec.describe User, type: :model do
  it "is a valid user" do
    user = User.new(first_name: "test", 
                    last_name: "last", 
                    username: "testy",
                    password: "password", 
                    password_confirmation: "password")
    expect(user).to be_valid
  end
  
  it "is invald without username" do
    user = User.new(first_name: "test", 
                    last_name: "last", 
                    username: nil,
                    password: "password", 
                    password_confirmation: "password")
    expect(user).to_not be_valid
  end
  
  it "is invald if it is a repeat username" do
    user = User.create(first_name: "test", 
                    last_name: "last", 
                    username: "testy",
                    password: "password", 
                    password_confirmation: "password")
    user2 = User.new(first_name: "test", 
                    last_name: "last", 
                    username: "testy",
                    password: "password", 
                    password_confirmation: "password")
    expect(user2).to_not be_valid
  end
end
