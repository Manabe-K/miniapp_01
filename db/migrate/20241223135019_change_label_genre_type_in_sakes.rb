class ChangeLabelGenreTypeInSakes < ActiveRecord::Migration[8.0]
  def change
    change_column :sakes, :label_genre, :integer, using: 'label_genre::integer'
  end
end
