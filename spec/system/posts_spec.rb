# frozen_string_literal: true

require 'rails_helper'

describe 'トップ画面(root_path)のテスト' do
  let!(:post) { create(:post, body:'hoge') }
  describe 'トップ画面(top_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'root_pathが"oinori.com/"であるか' do
        expect(current_path).to eq('/')
      end
      it 'トップ画面(root_path)に「お祈り一覧」が表示されているか' do
        expect(page).to have_content 'お祈り一覧'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'post[body]', with: Faker::Lorem.characters(number:20)
        click_button '祈りを捧げる'
        expect(page).to have_current_path root_path
      end
    end
  end

  describe "管理者ログイン画面(login_path)のテスト" do
    before do
      visit login_path
    end
    context '表示の確認' do
      it 'login_pathが"/login"であるか' do
        expect(current_path).to eq('/login')
      end
      it 'ログインボタンが表示されているか' do
        expect(page).to have_button 'ログイン'
      end
    end
  end
end