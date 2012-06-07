class AddRefreshEveryToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :refresh_every, :integer
  end
end
