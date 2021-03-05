require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
     it 'surname に漢字,ひらがな、カタカナで入力されていれば登録できる' do
      @user.surname = '山だダ'
      expect(@user).to be_valid
     end
     it 'first_name に漢字、ひらがな、カタカナで入力されていれば登録できる' do
      @user.first_name = '太ろウ'
      expect(@user).to be_valid
     end
     it 'surname_kanaがカタカナで入力されていれば登録できる' do
      @user.surname_kana = 'ヤマダ'
      expect(@user).to be_valid
     end
     it 'first_name_kanaがカタカナで入力されていれば登録できる' do
      @user.first_name_kana = 'タロウ'
      expect(@user).to be_valid
     end
    end
    context '新規登録できないとき' do
     it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it 'surnameが空では登録できない' do
      @user.surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Surname can't be blank"
     end
     it 'surnameに半角英字で入力されていた場合は登録できない' do
      @user.surname = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Surname 全角文字を使用してください"
     end
     it 'surnameに半角数字で入力されていた場合は登録できない' do
      @user.surname = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include "Surname 全角文字を使用してください"
     end
     it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", "First name 全角文字を使用してください"
     end
     it 'first_nameに半角英字で入力されていた場合は登録できない' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
     end
     it 'first_nameに半角数字で入力されていた場合は登録できない' do
      @user.first_name = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
     end
     it 'surname_kanaが空では登録できない' do
      @user.surname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Surname kana can't be blank", "Surname kana カタカナを使用してください"
     end
     it 'surname_kanaに　漢字で入力していた場合は登録できない' do
      @user.surname_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include "Surname kana カタカナを使用してください"
     end
     it 'surname_kanaに　ひらがなで入力していた場合は登録できない' do
      @user.surname_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Surname kana カタカナを使用してください"
     end
     it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank","First name kana カタカナを使用してください"
     end
     it 'first_name_kanaに　漢字で入力していた場合は登録できない' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana カタカナを使用してください"
     end
     it 'first_name_kanaに　ひらがなで入力していた場合は登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana カタカナを使用してください"
     end
     it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end
     it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it 'emailが一意性でない場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
     end
     it 'emailに@が含まれていない場合は登録できない' do
      @user.email = 'aaagmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
     end
     it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank","Password には英字と数字の両方を含めて設定してください","Password confirmation doesn't match Password"
     end
     it 'passwordが全角では登録できない' do
      @user.password = 'abc１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください"
     end
     it 'passwordが5文字以下の場合登録できない' do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end
     it 'passwordに半角英字が含まれていない場合登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
     end
     it 'passwordに半角数字が含まれていない場合登録できない' do
      @user.password = 'aaabbb'
      @user.password_confirmation = 'aaabbb'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
     end
     it 'passwordとpassword_confirmationが一致していない場合登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end
    end
  end
end
