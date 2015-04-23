require 'rails_helper'

RSpec.describe "admin tags" do 
  context "admin logged in " do
    let(:admin) do 
      User.create(first_name: "Kristina", 
                  last_name: "Brown", 
                  username: "kbrown", 
                  password: "password", 
                  role: 1 )
     end
    
    it "displays tags" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      
      visit admin_tags_path
      
      expect(page).to have_content("Listing Tags")
    end
  end
  
  context "non-admin logged in" do
    let(:default_user) do 
      User.create(first_name: "Kristina", 
                  last_name: "Brown", 
                  username: "kbrown", 
                  password: "password", 
                  role: 0 )
     end
     
     it "displays 404" do
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)
       
       visit admin_tags_path
       
       expect(page).to have_content("The page you were looking for doesn't exist.")
     end
   end

end