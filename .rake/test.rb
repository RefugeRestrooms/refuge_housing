require "rubocop/rake_task"

namespace :test do
  desc "Run RuboCop linter"
  RuboCop::RakeTask.new
end

