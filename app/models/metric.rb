class Metric < ActiveRecord::Base
  has_many :values, :dependent => :destroy
  has_many :assignments
  has_many :dashboards, :through => :assignments
  attr_accessible :dashboard_ids, :name, :description, :value_type, :string_value,
    :integer_value, :decimal_value, :position, :color, :width, :font_size, :refresh_every

  acts_as_list :scope => :dashboard

  def color
    return super if super
    '#CCCCCC'
  end

  def width
    return super if super
    1
  end

  def font_size
    return super if super
    50
  end

  def refresh_every
    return super if super
    0
  end

end
