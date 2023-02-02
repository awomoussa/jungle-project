require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

it "must match password with password confirmation" do 
  @user = User.create( name: "awo", email: "aw@o.com", password:"123" , password_confirmation: "123")
  @user.save
  expect(@user).to be_valid  
end    



it "must not be created if password is not matched with password confirmation" do 
    @user = User.create(name:"awo", email: "aw@o.com", password:"12" , password_confirmation: "123")
    @user.save
    expect(@user).to_not be_valid      
end

it "is not valid without a name" do 
  @user = User.create( email: "aw@o.com", password:"123" , password_confirmation: "123")
  @user.save
  expect(@user).to_not be_valid  
end     

it "is not valid without a distinct email" do 
  @user1 = User.create( name:"Awo", email: "a@wo.com", password:"123" , password_confirmation: "123")
  @user1.save
  @user2 = User.create( name:"Moussa", email: "a@wo.com", password:"123" , password_confirmation: "123")
  @user1.save
  expect(@user2).to be_invalid    
end   


it "is not valid if password is less than 3 characters" do 
  @user = User.create( name:"Awo", email: "a@wo.com", password:"1" , password_confirmation: "1")
  @user.save
  expect(@user).to_not be_valid  
end 
end 



describe '.authenticate_with_credentials' do

it "should login with right credentials" do
  @user = User.create( name:"Awo", email: "a@wo.com", password:"123" , password_confirmation: "123")
  @user.save
  @login = User.authenticate_with_credentials("a@wo.com", "123")
  expect(@login).to be_truthy
end


end



end