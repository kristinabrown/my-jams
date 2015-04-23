require 'rails_helper'

RSpec.describe "admin add a tag" do 
  context "admin add a tag with all attributes" do
    let(:admin) do 
      User.create(first_name: "Kristina", 
                  last_name: "Brown", 
                  username: "kbrown", 
                  password: "password", 
                  role: 1 )
     end
    
    it "adds a tag" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      
      visit new_admin_tag_path
      
      fill_in "Name", with: "rock"
      click_link_or_button "Create Tag"
      
      expect(page).to have_content("rock")
    end
  end
end