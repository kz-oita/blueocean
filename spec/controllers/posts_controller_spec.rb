require 'rails_helper'

describe PostsController, type: :controller do
  describe 'GET #index' do
    it "@postに正しい値が入っていること" do
      posts = create_list(:post, 3) 
      get :index
      expect(assigns(:posts)).to match(posts.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "@userに正しい値が入っていること" do
      expect(assigns(:user)).to eq user
    end

    it "@tagに正しい値が入っていること" do
      expect(assigns(:tag)).to eq tag
    end

    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "new.html.hamlに遷移する" do
      get :new
      expect(response).to render_template :new
    end
  end

  # describe 'POST #create' do
  #   it "@postに正しい値が入っているか" do
  #   end
  #   it "トップページに遷移するか" do
  #   end
  #   it "newアクションにrenderされるか" do
  #   end
  # end

  # describe 'GET #show' do
  #   it "@postに正しい値が入っているか" do
  #   end

  #   it "@commentに正しい値が入っているか" do
  #   end

  #   it "show.html.hamlに遷移する" do
  #   end
  # end

  describe 'GET #edit' do
    it "@postに正しい値が入っているか" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    it "edit.html.hamlに遷移する" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end

  # describe 'POST #update' do
  #   it "投稿詳細ページに遷移されるか" do
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it "トップページに遷移されるか" do
  #   end
  # end

end