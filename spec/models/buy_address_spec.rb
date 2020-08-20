require 'rails_helper'
describe BuyAddress, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, item_id: item.id, user_id: buyer.id)
    sleep 2
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it 'zip_code,prefecture_id,city,address1,telephone,itemが存在すれば購入できる' do
        expect(@buy_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'zip_codeが空で-が無しだと購入できない' do
        @buy_address.zip_code = ' '
        @buy_address.valid?
        # binding.pry
        expect(@buy_address.errors.full_messages).to include("Zip code can't be blank", 'Zip code is invalid')
      end
      it 'prefecture_idが空だと購入できない' do
        @buy_address.prefecture_id = ' '
        @buy_address.valid?
        # binding.pry
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture Select')
      end
      it 'prefecture_idが0だと購入できない' do
        @buy_address.prefecture_id = 0
        @buy_address.valid?
        # binding.pry
        expect(@buy_address.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空だと購入できない' do
        @buy_address.city = ' '
        @buy_address.valid?
        # binding.pry
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空だと購入できない' do
        @buy_address.address1 = ' '
        @buy_address.valid?
        # binding.pry
        expect(@buy_address.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'telephoneが空だと購入できない' do
        @buy_address.telephone = ' '
        @buy_address.valid?
        # binding.pry
        expect(@buy_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが11桁以上だと購入できない' do
        @buy_address.telephone = ' '
        @buy_address.valid?
        # binding.pry
        expect(@buy_address.errors.full_messages).to include("Telephone can't be blank")
      end
    end
  end
end
