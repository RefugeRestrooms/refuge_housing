require "rspec/core/rake_task"
require "rubocop/rake_task"

task test: ["test:rubocop", "test:spec"]

namespace :test do
  desc "Run RSpec unit tests"
  RSpec::Core::RakeTask.new(:spec)

  desc "Run RuboCop linter"
  RuboCop::RakeTask.new
end

