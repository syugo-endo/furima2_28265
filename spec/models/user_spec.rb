require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で半角英数字であれば登録できる' do
        @user.password = '123abcd'
        @user.password_confirmation = '123abcd'
        expect(@user).to be_valid
      end
      it 'family_nameとfirst_nameが全角で入力されている' do
        @user.family_name = '山田'
        @user.first_name = '太郎'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'family_name_kanaとfirst_name_kanaが全角カタカナで入力されている' do
        @user.family_name = 'ヤマダ'
        @user.first_name = 'タロウ'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'kkkgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合でないと登録できない' do
        @user.password = '123333'
        @user.password_confirmation = '123333'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数混合で入力してください。')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameとfirst_nameが全角で入力されている' do
        @user.family_name = 'yamada'
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name は全角で入力してください。', 'First name は全角で入力してください。')
      end
      it 'family_name_kanaとfirst_name_kanaが全角カタカナで入力されている' do
        @user.family_name_kana = '山田'
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana は全角カタカナで入力して下さい。', 'First name kana は全角カタカナで入力して下さい。')
      end
    end
  end
end
