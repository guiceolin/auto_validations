require 'test_helper'

class AboveLengthValidationsTest < Test::Unit::TestCase
  def setup
    Android.auto_length_validation

    @android = Android.new :name => 'A Very big name indeed',
                           :description => 'Fuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu',
                           :number => 115
  end

  def test_should_add_errors_to_the_name_field
    assert @android.invalid?
    assert_not_nil @android.errors[:name]
  end

  def test_should_add_errors_to_the_descriptiom_field
    assert @android.invalid?
    assert_not_nil @android.errors[:description]
  end

  def test_should_add_errors_to_the_number_field
    assert @android.invalid?
    assert_not_nil @android.errors[:number]
  end
end

class BelowLengthValidationsTest < Test::Unit::TestCase
  def setup
    Android.auto_length_validation

    @android = Android.new :name => 'Android',
                           :description => 'DBZ character',
                           :number => 16
  end

  def test_should_be_valid
    assert @android.valid?
  end
end

class AllowBlankTest < Test::Unit::TestCase
  def setup
    Android.auto_length_validation
    @android = Android.new :name => nil
  end

  def test_should_not_throw_errors
    assert_nothing_thrown { @android.valid? }
  end
end

class WithExceptTest < Test::Unit::TestCase
  def setup
    Saiyajin.auto_length_validation :except => 'name'
    @saiyajin = Saiyajin.new :name => 'Goku the super saiyajin in the earth', :age => 5, :super => true
  end

  def test_should_be_valid
    assert @saiyajin.valid?
  end 
end

