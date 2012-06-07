class CreateDashboardsMetrics < ActiveRecord::Migration
  def change
    create_table :dashboards_metrics do |t|
      t.integer :dashboard_id
      t.integer :metric_id
    end
  end
end
