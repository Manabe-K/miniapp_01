class UpdateSakesTable < ActiveRecord::Migration[8.0]
  def change
    rename_column :sakes, :taste, :sake_meter_value
    change_column :sakes, :sake_meter_value, :integer, using: 'sake_meter_value::integer', null: false

    rename_column :sakes, :sweetness, :price
    change_column :sakes, :price, :integer, using: 'sake_meter_value::integer', null: false

    rename_column :sakes, :origin, :prefecture
    change_column :sakes, :prefecture, :string, using: 'sake_meter_value::integer', null: false

    rename_column :sakes, :image_url, :label_image

    # 新しいカラムの追加
    add_column :sakes, :label_genre, :string, null: false
  end
end
