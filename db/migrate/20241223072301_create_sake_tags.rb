class CreateSakeTags < ActiveRecord::Migration[8.0]
  def change
    create_table :sake_tags do |t|
      t.integer :sake_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end

    # 外部キーを追加
    add_foreign_key :sake_tags, :sakes, column: :sake_id
    add_foreign_key :sake_tags, :tags, column: :tag_id

    # インデックスを追加してユニーク制約を付与
    add_index :sake_tags, [:sake_id, :tag_id], unique: true
  end
end
