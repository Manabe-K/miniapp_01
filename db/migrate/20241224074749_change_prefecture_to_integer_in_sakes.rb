class ChangePrefectureToIntegerInSakes < ActiveRecord::Migration[8.0]
  def change
    change_column :sakes, :prefecture, 'integer USING prefecture::integer', null: false
  end
end
