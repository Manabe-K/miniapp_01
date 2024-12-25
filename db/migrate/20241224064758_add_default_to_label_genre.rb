class AddDefaultToLabelGenre < ActiveRecord::Migration[8.0]
  def change
    change_column_default :sakes, :label_genre, 0
  end
end
