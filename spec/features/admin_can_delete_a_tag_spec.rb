RSpec.describe "admin delete a tag" do 
  context "admin delete a tag" do
    let(:admin) do 
      User.create(first_name: "Kristina", 
                  last_name: "Brown", 
                  username: "kbrown", 
                  password: "password", 
                  role: 1 )
     end
    
    it "deletes a tag" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      
      visit new_admin_tag_path
      
      fill_in "Name", with: "rock"
      click_link_or_button "Create Tag"
      
      expect(page).to have_content("rock")
      
      click_link_or_button "delete"
      
      expect(page).to_not have_content("rock")
    end
  end
end