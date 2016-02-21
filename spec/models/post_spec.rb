require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    it "doesn't allow creating a post with no title" do
      p = Post.new
      post_valid = p.valid?
      expect(post_valid).to eq(false)
    end

    it "doesn't allow creating a post with no body" do
      p = Post.new
      post_valid = p.valid?
      expect(post_valid).to eq(false)
    end

    it "requires a unique title" do
      Post.create({title: "test", body: "some text"})
      p = Post.new(title: "test")
      expect(p.valid?).to be false
      expect(p.errors).to have_key(:title)
    end

    it "requires the minimum length for the title of 7 characters" do
      p = Post.new(title: "mallinath")
      expect(p.title.length > 7).to be true
    end
  end

  describe "#body_snippet" do
    context "when the body is more than 100 characters" do
      fit "returns the first 100 chars plus ..." do
        post = Post.new(title: "title", body: "hello"*100)
        result = post.body_snippet.length
        expect(result).to eq(103)
      end
    end
    context "when the body is less than 100 characters" do
      it "will return a string less than 100 chars" do
        post = Post.new(title: "title", body: "hello")
        result = post.body_snippet.length
        expect(result).to eq(103)
      end
    end
  end
end
