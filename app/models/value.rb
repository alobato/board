class Value < ActiveRecord::Base
  belongs_to :metric

  scope :recent, lambda {|limit| order('created_at DESC').limit(limit) }
end
