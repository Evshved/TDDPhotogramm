require 'rails_helper'


feature 'Index displays posts on root' do
  it 'should have the index displays correct created job information' do
  job_one = create(:post, caption: "This is post one")
  job_two = create(:post, caption: "This is the second post")
  visit '/'
  expect(page).to have_content('This is first post')

  end
end

feature 'Can view individual post' do
  it 'Should click and view a single post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')] ").click
    expect(page.current_path).to eq(post_path(post))
  end

end
