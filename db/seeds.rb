# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def generate_sake_name(index)
  "テスト日本酒#{index + 1}"  # 1から始まる番号を付与
end

# ランダムな sake_meter_value の範囲 (-10.0 ~ +10.0)
def random_sake_meter_value
  rand(-10.0..10.0).round(2)
end

# ランダムな price (20000以下)
def random_price
  rand(1..20000)
end

# ランダムな label_genre (0 ~ 2)
def random_label_genre
  rand(0..2)
end

# ランダムな type_of_sake (0 ~ 8)
def random_type_of_sake
  rand(0..8)
end

# 各都道府県に10つの日本酒を追加
(0..46).each do |prefecture|
  10.times do |index|
    Sake.create!(
      name: generate_sake_name(index + prefecture * 5),  # テスト日本酒1, テスト日本酒2,... を生成
      sake_meter_value: random_sake_meter_value,
      price: random_price,
      prefecture: prefecture,
      label_genre: random_label_genre,
      type_of_sake: random_type_of_sake
    )
  end
end

puts "全国の日本酒データを10つずつ作成しました"
