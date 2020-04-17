require 'rails_helper'

describe PostsController, type: :controller do
  describe 'GET #new' do
    it "new.html.hamlに遷移する" do
      get :new
      expect(response).to render_template :new
    end
  end

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

end