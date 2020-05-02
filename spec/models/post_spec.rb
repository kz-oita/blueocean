require 'rails_helper'
describe Post, type: :model do
  describe '#create' do
    it "title、text、imageが存在すれば登録できる" do
      expect(build(:post)).to be_valid
    end
    it "titleがない場合は登録できない" do
      post = build(:post, title: "")
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end
    it "textがない場合は登録できない" do
      post = build(:post, text: "")
      post.valid?
      expect(post.errors[:text]).to include("can't be blank")
    end
    it "imageがない場合は登録できない" do
      post = build(:post, image: "")
      post.valid?
      expect(post.errors[:image]).to include("can't be blank")
    end
  end
end