class Assignment < ActiveRecord::Base
  attr_accessible :dashboard_id, :metric_id
  belongs_to :dashboard
  belongs_to :metric
end
