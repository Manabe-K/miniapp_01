class ChangeScaleOfSakeMeterValue < ActiveRecord::Migration[8.0]
  def change
    change_column :sakes, :sake_meter_value, :decimal, precision: 5, scale: 1
  end
end
