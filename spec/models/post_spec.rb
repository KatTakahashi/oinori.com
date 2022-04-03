# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:post)).to be_valid
  end
end

# describe: テストのタイトル(必須)
# content：テストのサブタイトル
# it：具体的なテストの内容の説明(必須)
# expect(A).to eq B：AがBと一致するかを判定
# エクスペクテーション：expect().toの部分
# マッチャ―：テスト確認の種類。eqの他にも種類がある。