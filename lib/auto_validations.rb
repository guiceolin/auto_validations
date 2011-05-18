require 'rubygems'
require 'bundler/setup'
require 'active_record'

module AutoValidations
  extend ActiveSupport::Concern

  module ClassMethods
    def auto_length_validation(options = {})
      options[:except] = Array.wrap(options[:except])
      options[:except].map!(&:to_s)

      options.reverse_merge! :ignore_types => [:boolean, :datetime] 

      columns.each do |column|

        next if options[:except].include?(column.name)
        next if options[:ignore_types].include?(column.type)

        validates_length_of column.name, :maximum => column.limit, :allow_blank => true if column.limit
      end
    end
  end
end

class ActiveRecord::Base
  include AutoValidations
end
