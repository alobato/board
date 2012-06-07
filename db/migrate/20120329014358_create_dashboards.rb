class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
