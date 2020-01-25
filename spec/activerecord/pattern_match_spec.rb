require 'spec_helper'

RSpec.describe Activerecord::PatternMatch do
  context "unusing" do
    let(:user) { User.create(name: "Homu", age: 14) }
    subject { -> { user in { name:, age: } } }
    it { is_expected.to raise_error NoMatchingPatternError }
  end

  context "using Activerecord::PatternMatch" do
    class Apply
      using ActiveRecord::PatternMatch
      def self.to_proc
        proc { user in { name:, age: } }
      end
    end
    let(:user) { User.create(name: "Homu", age: 14) }
    subject { -> { instance_exec &Apply } }
    it { is_expected.not_to raise_error }
  end
end
