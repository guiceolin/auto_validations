require 'rubygems'
require 'bundler/setup'
require 'active_record'

module AutoValidations
  extend ActiveSupport::Concern

  module ClassMethods
    def auto_length_validation
      columns.each do |column|
        validates_length_of column.name, :maximum => column.limit, :allow_blank => true if column.limit
      end
    end
  end
end

class ActiveRecord::Base
  include AutoValidations
end
