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

  describe "GET #create" do
    it "creates a post" do
      post :create, post: attributes_for(:post)

      expect(Post.all.first.title).to eq(attributes_for(:post)[:title])
    end

    it "does not activate a created post" do
      post :create, post: attributes_for(:post)

      expect(Post.active).to match_array([])
    end
  end

  describe "GET #confirm" do
    it "activates a post" do
      post = create(:post)
      get :confirm, validation: post.validation

      expect(Post.active).to match_array([post])
    end
  end

  describe "DELETE #destroy" do
    it "removes a post from search" do
      post = create(
        :post,
        id: 1,
        validation: "0f21473d03145662d38ce4ea1ebac790",
        show: true
      )
      delete :destroy, id: post.id, validation: post.validation

      expect(Post.active).to be_empty
    end

    it "redirect to error page when invalid" do
      post = create(
        :post,
        id: 1,
        validation: "0f21473d03145662d38ce4ea1ebac790",
        show: true
      )
      delete :destroy, id: post.id, validation: "0f21473d03145662d38ce4ea1ebac791"

      expect(response).to redirect_to validation_error_url
    end
  end
end
