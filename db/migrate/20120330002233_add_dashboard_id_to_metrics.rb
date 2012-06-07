class AddDashboardIdToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :dashboard_id, :integer
  end
end
