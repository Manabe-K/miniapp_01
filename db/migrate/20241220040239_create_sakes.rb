class CreateSakes < ActiveRecord::Migration[8.0]
  def change
    create_table :sakes do |t|
      t.string :name, null: false               # お酒の名前
      t.string :taste                           # 味わい (フルーティー, 濃厚, etc.)
      t.string :sweetness                       # 甘辛度 (甘口, 辛口, etc.)
      t.string :origin                          # 産地 (都道府県名)
      t.string :image_url                       # お酒の画像
      t.timestamps
    end
  end
end
