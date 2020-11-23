require 'rails_helper'

RSpec.describe Service, type: :model do
  describe '#create' do
    before do
      @service = FactoryBot.build(:service)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@service).to be_valid
    end

    it 'imageが空では保存できないこと' do
      @service.image = nil
      @service.valid?
      expect(@service.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では保存できないこと' do
      @service.name = nil
      @service.valid?
      expect(@service.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では保存できないこと' do
      @service.description = nil
      @service.valid?
      expect(@service.errors.full_messages).to include("Description can't be blank")
    end

    it 'categoryを選択していないと保存できないこと' do
      @service.category_id = 1
      @service.valid?
      expect(@service.errors.full_messages).to include('Category must be other than 1')
    end

    it 'transpottationを選択していないと保存できないこと' do
      @service.transportation_id = 1
      @service.valid?
      expect(@service.errors.full_messages).to include('Transportation must be other than 1')
    end

    it 'prefectureを選択していないと保存できないこと' do
      @service.prefecture_id = 0
      @service.valid?
      expect(@service.errors.full_messages).to include('Prefecture must be other than 0')
    end

    it 'durationを選択していないと保存できないこと' do
      @service.duration_id = 1
      @service.valid?
      expect(@service.errors.full_messages).to include('Duration must be other than 1')
    end

    it 'priceが空だと保存できないこと' do
      @service.price = nil
      @service.valid?
      expect(@service.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが全角数字だと保存できないこと' do
      @service.price = '２０００'
      @service.valid?
      expect(@service.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが99円未満では保存できないこと' do
      @service.price = 99
      @service.valid?
      expect(@service.errors.full_messages).to include('Price must be greater than or equal to 100')
    end

    it 'priceが9,999,999円を超過すると保存できないこと' do
      @service.price = 10_000_000
      @service.valid?
      expect(@service.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'userが紐付いていないと保存できないこと' do
      @service.user = nil
      @service.valid?
      expect(@service.errors.full_messages).to include('User must exist')
    end
  end
end
