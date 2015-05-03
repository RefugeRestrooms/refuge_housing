require "rails_helper"

describe PostsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @posts" do
      post1 = create(:post, show: true)
      post2 = create(:post, street: "Shattuck Ave.", show: true)
      get :index

      expect(assigns(:posts)).to match_array([post1, post2])
    end
  end

  describe "GET #new" do
    it "" do
    end
  end

  describe "GET #create" do
    it "creates a post" do
    end
  end

  describe "GET #confirm" do
    it "activates a post" do
      post = create(:post)
      post_active = create(:post, show: true)
      get :confirm, validation: post.validation

      expect(Post.active).to match_array([post_active])
    end
  end

  describe "DELETE #destroy" do
    it "removes a post from search" do
      post1 = create(
        :post,
        id: 1,
        validation: "7c745b58bd4e49d81f117ab738f451f4",
        show: true
      )
      post2 = create(:post, show: true)
      delete :destroy, id: post1.id, validation: post2.validation

      expect(Post.active).to match_array([post2])
    end
  end
end
