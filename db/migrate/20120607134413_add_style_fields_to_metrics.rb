class AddStyleFieldsToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :color, :string
    add_column :metrics, :width, :integer
    add_column :metrics, :font_size, :integer
  end
end
