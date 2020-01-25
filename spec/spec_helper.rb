require "bundler/setup"
require "activerecord/pattern_match"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
end

tmp_stdout = $stdout
$stdout = StringIO.new
require 'schema'
$stdout = tmp_stdout
