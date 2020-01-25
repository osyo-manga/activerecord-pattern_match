require "activerecord/pattern_match/version"
require 'active_record'

module ActiveRecord
  module PatternMatch
    refine ::ActiveRecord::Base do
      using ::ActiveRecord::PatternMatch
      def deconstruct_keys(keys)
        attributes.transform_keys(&:to_sym).select { keys.include?(_1) }
      end

      # MEMO: respond_to? is defined ActiveRecord
      #       redefine respond_to? because it is not called in refinments
      def respond_to?(name, *args)
        name == :deconstruct_keys ? true : super(name, *args)
      end
    end
  end
end
