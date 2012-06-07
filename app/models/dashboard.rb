class Dashboard < ActiveRecord::Base
  has_many :assignments
  has_many :metrics, :through => :assignments, :order => "position"
  attr_accessible :name, :description
end
