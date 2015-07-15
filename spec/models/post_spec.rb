require "rails_helper"

describe Post do
  describe ".active" do
    it "returns only active posts" do
      active_post = create(:post, show: true)
      # rubocop:disable UselessAssignment
      non_active_post = create(:post)

      result = Post.active

      expect(result).to eq [active_post]
    end
  end

  describe ".near" do
    it "returns a post nearby" do
      post = create(:post, city: "Berkeley", state: "CA", show: true)

      result = Post.near("Berkeley, CA")

      expect(result).to eq [post]
    end
  end

  describe ".toggle_show" do
    it "toggles nil to true" do
      post = create(:post)

      post.toggle_show(true)

      expect(post.show).to eq true
    end

    it "toggles true to false" do
      post = create(:post, show: true)

      post.toggle_show(false)

      expect(post.show).to eq false
    end

    it "toggles false to true" do
      post = create(:post, show: false)

      post.toggle_show(true)

      expect(post.show).to eq true
    end
  end

  describe "#address" do
    it "returns a full address with street" do
      post = build(:post,
                   street: "Adeline St.",
                   city: "Berkeley",
                   state: "CA",
                   country: "USA"
                  )

      expect(post.address).to eq "Adeline St., Berkeley, CA, USA"
    end

    it "returns a full address without street" do
      post = build(:post, city: "Berkeley", state: "CA", country: "USA")

      expect(post.address).to eq "Berkeley, CA, USA"
    end
  end

  describe ".generate_validation" do
    it "returns a 32 bit hash" do
      validation = Post.generate_validation

      expect(validation).to match(/\h{32}/)
    end
  end

  describe ".create_default_params" do
    it "returns a validator" do
      params = Post.create_default_params({})

      expect(params).to include(:validation)
    end

    it "returns an expiration" do
      params = Post.create_default_params({})

      expect(params).to include(:expiration)
    end

    it "converts post type to int" do
      params = Post.create_default_params(post_type: "1")

      expect(params).to include(post_type: 1)
    end
  end
end
