require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('spec/fixtures/files/test_image.jpeg')
  end

  it 'category,condition,image,name,text,shipping_date,shipping_fee,prefecture_id,priceが存在していれば出品できる' do
    expect(@item).to be_valid
  end

  it 'imageが空では保存できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it 'categoryが1では保存できない' do
    @item.category = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Category Select')
  end
  it 'categoryが空では保存できない' do
    @item.category = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it 'conditionが1では保存できない' do
    @item.condition = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Condition Select')
  end
  it 'conditionが空では保存できない' do
    @item.condition = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
  it 'nameが空では保存できない' do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  it 'textが空では保存できない' do
    @item.text = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Text can't be blank")
  end
  it 'shipping_feeが1では保存できない' do
    @item.shipping_fee = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Shipping fee Select')
  end
  it 'shipping_feeが空では保存できない' do
    @item.shipping_fee = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
  end
  it 'shipping_dateが1では保存できない' do
    @item.shipping_date = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Shipping date Select')
  end
  it 'shipping_dateが空では保存できない' do
    @item.shipping_date = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping date can't be blank")
  end
  it 'prefecture_idが0では保存できない' do
    @item.prefecture_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include('Ship from Select')
  end
  it 'prefecture_idが空では保存できない' do
    @item.prefecture_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Ship from can't be blank")
  end
  it 'priceが¥300以下では保存できない' do
    @item.price = 260
    @item.valid?
    expect(@item.errors.full_messages).to include('Price Out of setting range')
  end
  it 'priceが¥9999999以上では保存できない' do
    @item.price = 100_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include('Price Out of setting range')
  end
end
