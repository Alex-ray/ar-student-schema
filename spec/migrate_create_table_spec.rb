require 'rspec'
require_relative '../db/config'


describe "create students table with correct schema" do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
  end

  it "should have a Students table" do
    ActiveRecord::Base.connection.table_exists?(:students).should be_true
  end

  it "should have the right columns and types" do
    expected = {
      :integer => ["id"],
      :string => ["first_name", "last_name", "gender", "email", "phone"],
      :date => ["birthday"]
    }

    ActiveRecord::Base.connection.columns(:students).each do |col|
      expected[col.type].include?(col.name).should be_true
    end
  end
end

describe "create teachers table with correct schema" do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
  end

  it "should have a Teachers table" do
    ActiveRecord::Base.connection.table_exists?(:teachers).should be_true
  end

  it "should have the right columns and types" do
    expected = {
      :integer => ["id"],
      :string => ["first_name", "last_name", "email", "phone"]
    }

    ActiveRecord::Base.connection.columns(:teachers).each do |col|
      expected[col.type].include?(col.name).should be_true
    end
  end
end
