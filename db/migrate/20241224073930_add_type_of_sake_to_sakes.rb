class AddTypeOfSakeToSakes < ActiveRecord::Migration[8.0]
  def change
    add_column :sakes, :type_of_sake, :string, null: false
  end
end
