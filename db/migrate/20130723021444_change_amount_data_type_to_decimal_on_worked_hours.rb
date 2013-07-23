class ChangeAmountDataTypeToDecimalOnWorkedHours < ActiveRecord::Migration
  def up
  	change_column :worked_hours, :amount, :decimal, precision: 22, scale: 20
  end

  def down
  	change_column :worked_hours, :amount, :float
  end
end
