# why heroku, why?
begin
  require "rspec/core/rake_task"
  require "rubocop/rake_task"
  require "scss_lint/rake_task"

  task test: ["test:scss_lint", "test:rubocop", "test:spec"]

  namespace :test do
    desc "Run RSpec unit tests"
    RSpec::Core::RakeTask.new(:spec)

    desc "Run RuboCop linter"
    RuboCop::RakeTask.new

    desc "Run SCSS Linter"
    SCSSLint::RakeTask.new do |t|
      t.config = ".scss-lint.yml"
    end
  end
rescue LoadError
end
