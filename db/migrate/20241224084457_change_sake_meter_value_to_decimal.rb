class ChangeSakeMeterValueToDecimal < ActiveRecord::Migration[8.0]
  def change
    change_column :sakes, :sake_meter_value, :decimal, null: false, precision: 5, scale: 2
  end
end
