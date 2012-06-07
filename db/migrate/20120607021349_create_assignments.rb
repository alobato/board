class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :dashboard_id
      t.integer :metric_id
      t.integer :position
      t.timestamps
    end
    drop_table :dashboards_metrics
  end
end
