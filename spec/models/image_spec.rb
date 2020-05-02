require 'rails_helper'
describe Image do
  describe '#create' do
    it "srcが存在すれば登録できること" do
      image = build(:image)
      expect(image).to be_valid
    end
    it "srcがない場合は登録できないこと" do
      image = build(:image, src: "")
      image.valid?
      expect(image.errors[:src]).to include("can't be blank")
    end
  end
end