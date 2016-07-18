require 'rails_helper'

feature 'Editing posts' do
  it "won't update a post without an image" do
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end

  background do
    job = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')").click
    click_link 'Edit_post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Back in black"
    click_button 'Update Post'
    expect(page).to have_content ("Post updated  - success")
    expect(page).to have_content ("Back in black")
  end
end

# create a job with factory_girl
# visit the root route
# click the image of the post we created with factory_girl
# click the 'edit post' link
# fill in 'Caption' with "Back in black"
# click the ’Update Post’ button
# expect the page to have content saying "Post updated hombre."
# expect the page to have content saying “Oh god, you weren’t meant to see this picture!”
#Yeah, it’s a bit long but it’s pretty obvious what we’re trying to achieve here. Using your ever expanding knowledge to build out this spec by yourself. Call the spec, editing_posts_spec.rb and plop it in your spec/features/ folder.

