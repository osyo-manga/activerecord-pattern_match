require 'spec_helper'

RSpec.describe Activerecord::PatternMatch do
  context "unusing" do
    describe "case in" do
      let(:user) { User.create(name: "Homu", age: 14) }
      subject { -> { user in { name:, age: } } }
      it { is_expected.to raise_error NoMatchingPatternError }
    end

    describe "#deconstruct_keys" do
      let(:user) { User.create(name: "Homu", age: 14) }
      let(:keys) { [:name] }
      subject { -> { user.deconstruct_keys(keys) } }
      it { is_expected.to raise_error NoMethodError }
    end

    describe "#respond_to?" do
      let(:user) { User.create(name: "Homu", age: 14) }
      subject { user.respond_to? argument }
      context "argument is `:deconstruct_keys`" do
        let(:argument) { :deconstruct_keys }
        it { is_expected.to be_falsey }
      end
      context "argument is not defined method name`" do
        let(:argument) { :hogehoge }
        it { is_expected.to be_falsey }
      end
    end
  end

  context "using Activerecord::PatternMatch" do
    using ActiveRecord::PatternMatch

    describe "case in" do
      let(:user) { User.create(name: "Homu", age: 14) }
      subject { -> { user in { name:, age: } } }
      it { is_expected.not_to raise_error }
    end

    describe "#deconstruct_keys" do
      let(:user) { User.create(name: "Homu", age: 14) }
      let(:keys) { [:name] }
      subject { user.deconstruct_keys(keys) }
      it { is_expected.to include(name: "Homu") }
      it { is_expected.not_to include(:age) }

      context "keys is empty" do
        let(:keys) { [] }
        it { is_expected.not_to include(:name, :age) }
      end
    end

    describe "#respond_to?" do
      let(:user) { User.create(name: "Homu", age: 14) }
      subject { user.respond_to? argument }
      context "argument is `:deconstruct_keys`" do
        let(:argument) { :deconstruct_keys }
        it { is_expected.to be_truthy }
      end
      context "argument is not defined method name`" do
        let(:argument) { :hogehoge }
        it { is_expected.to be_falsey }
      end
    end
  end
end
