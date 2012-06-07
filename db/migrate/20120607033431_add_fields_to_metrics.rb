class AddFieldsToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :value_type, :string
    add_column :metrics, :string_value, :string
    add_column :metrics, :integer_value, :integer
    add_column :metrics, :decimal_value, :decimal, :precision => 10, :scale => 2
    add_column :metrics, :position, :integer
  end
end
