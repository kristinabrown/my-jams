require 'rails_helper'

RSpec.describe "admin edit a tag" do 
  context "admin edit a tag with all attributes" do
    let(:admin) do 
      User.create(first_name: "Kristina", 
                  last_name: "Brown", 
                  username: "kbrown", 
                  password: "password", 
                  role: 1 )
     end
     
     it "edits a tag" do
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
       
       visit new_admin_tag_path
       
       fill_in "Name", with: "rock"
       click_link_or_button "Create Tag"
       
       expect(page).to have_content("rock")
       
       first(:link, 'edit').click
       
       fill_in "Name", with: "rock n roll"
       click_link_or_button "Update Tag"
       
       expect(page).to have_content("rock n roll")
     end
   end
   
   
 end