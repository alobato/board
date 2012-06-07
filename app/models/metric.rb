class Metric < ActiveRecord::Base
  has_many :values, :dependent => :destroy
  has_many :assignments
  has_many :dashboards, :through => :assignments
  attr_accessible :dashboard_ids, :name, :description, :value_type, :string_value,
    :integer_value, :decimal_value, :position, :color, :width, :font_size, :refresh_every

  acts_as_list :scope => :dashboard

  def color
    self.color || '#CCCCCC'
  end

  def width
    self.width || 1
  end

  def font_size
    self.font_size || 50
  end

  def refresh_every
    self.refresh_every || 0
  end

end
