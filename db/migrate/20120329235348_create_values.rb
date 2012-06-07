class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :metric_id
      t.decimal :decimal_value, :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
