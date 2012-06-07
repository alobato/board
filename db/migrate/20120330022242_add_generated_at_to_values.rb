class AddGeneratedAtToValues < ActiveRecord::Migration
  def change
    add_column :values, :generated_at, :datetime
  end
end
