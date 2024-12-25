class ChangeTypeOfSakeToIntegerInSakes < ActiveRecord::Migration[8.0]
  def change
    change_column :sakes, :type_of_sake, 'integer USING type_of_sake::integer', null: false
  end
end
