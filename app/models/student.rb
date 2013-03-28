require_relative '../../db/config'

class Student < ActiveRecord::Base 
  validates :email, :uniqueness => true
  validates :age, :numericality => { :greater_than => 3 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :on => :create
  validates_format_of :phone, :with => /.{0,}\d.{0,}\d.{0,}\d.{0,}\d.{0,}\d.{0,}\d.{0,}\d.{0,}\d.{0,}\d.{0,}\d.*/, :on => :create

  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Time.now
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end
end
