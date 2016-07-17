require 'rails_helper'
require 'spec_helper'

feature 'Editing posts' do
  it "won't update a post without an image" do
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end
end
