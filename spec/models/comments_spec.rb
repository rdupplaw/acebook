require 'rails_helper'

RSpec.describe Comment, type: :model do

  before(:each) do
    user = User.new(firstname: 'Example', lastname: 'User', email: 'user@example.com',
      password: 'foobar', password_confirmation: 'foobar')
    user.save

    @post = user.posts.create(id: 1, message: 'test', created_at: DateTime.now, updated_at: DateTime.now)
  end

  it "cannot leave an empty comment" do
    comment = @post.comments.create
    expect(comment).not_to be_valid
  end

  it "can leave a comment" do
    comment = @post.comments.create(body: "hello")
    expect(comment).to be_valid
  end
  
  it "cannot leave a comment longer than 250 chars" do
    string = ""
    251.times {string << "a"}
    comment= @post.comments.create(body: string)
    expect(comment).not_to be_valid
  end
end