require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    it "doesn't allow creating a post with no title" do
      p = Post.new
      post_valid = p.valid?
      expect(post_valid).to eq(false)
    end

    it "requires a unique title" do
      Post.create({title: "test", body: "some text"})
      p = Post.new(title: "test")
      p.valid?
      expect(p.errors).to have_key(:name)
    end
  end
end
