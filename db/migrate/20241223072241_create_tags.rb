class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false # タグ名（例: 大吟醸）
      t.timestamps
    end
  end
end
