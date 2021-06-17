require 'rails_helper'

RSpec.describe Comment, type: :model do

  before(:each) do
    @post = Post.new(id: 1, message: 'test', created_at: DateTime.now, updated_at: DateTime.now)
    @post.save
  end

  it "cannot leave an empty comment" do
    comment = @post.comments.create
    expect(comment).not_to be_valid
  end
  it "cannot leave a comment longer than 250 chars" do
    string = ""
    251.times {string << "a"}
    comment= @post.comments.create(body: string)
    expect(comment).not_to be_valid
  end
end