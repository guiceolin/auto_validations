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
  end

  def test_should_not_include_validator_on_name
    assert_equal Saiyajin.validators_on(:name).map(&:kind).include?(:lenght), false
  end 

  def test_should_include_validation_on_age
    assert Saiyajin.validators_on(:age).map(&:kind).include?(:length)
  end
end

class WithExceptAsArrayTest < Test::Unit::TestCase
  def setup
    Namek.auto_length_validation :except => ['name', :master]  
  end

  def test_should_not_include_validator_on_name
    assert_equal Namek.validators_on(:name).map(&:kind).include?(:lenght), false
  end 

  def test_should_not_include_validation_on_master
    assert_equal Namek.validators_on(:master).map(&:kind).include?(:length), false
  end
 
  def test_should_include_validation_on_qi
    assert Namek.validators_on(:qi).map(&:kind).include?(:length)
  end
end

class IgnoreFieldsTest < Test::Unit::TestCase
  def setup 
    Saiyajin.auto_length_validation
  end

  def test_should_not_include_validation_on_boolean_file
    assert_equal Saiyajin.validators_on(:super).map(&:kind).include?(:length), false
  end

  def test_should_include_validation_on_text_file
    assert Saiyajin.validators_on(:name).map(&:kind).include?(:length)
  end
end




