if ENV['RAILS_ENV'] == 'test'
  require 'rubygems'
  require 'bundler/setup'
  require 'rspec/core/rake_task'
  require 'rake'

  ENV["RAILS_ENV"] = 'test'
  require File.expand_path("../../../config/environment", __FILE__)


  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.rspec_opts = ['--backtrace '] if ENV['DEBUG']
    spec.verbose = true
  end

  desc 'Default: run the unit tests.'
  task default: [:spec]


  def recent_specs(touched_since)
    recent_specs = Dir['app/**/*'].map do |path|
      if File.mtime(path) > touched_since
        spec = File.join('spec', File.dirname(path).split("/")[1..-1].join('/'),
        "#{File.basename(path, ".*")}_spec.rb")
        spec if File.exists?(spec)
      end
    end.compact

    recent_specs += Dir['spec/**/*_spec.rb'].select do |path|
      File.mtime(path) > touched_since
    end.uniq
  end

  namespace :spec do
    desc 'Run all recent specs in spec directory touched in last 10 minutes'
    RSpec::Core::RakeTask.new(:recent) do |t|
      t.rspec_opts = ['--options', "\"#{Rails.root}/.rspec\""]
      t.pattern = recent_specs(Time.now - 10.minutes)
    end
  end


  SPEC_SUITES = [
    { :id => :controllers, :title => 'Controllers', :files => %w(spec/app/controllers) },
    { :id => :models, :title => 'Models', :files => %w(spec/app/models) },
    { :id => :lib, :title => 'Lib Classes', :files => %w(spec/lib/classes) },
    { :id => :helpers, :title => 'Lib Helpers', :files => %w(spec/lib/helpers) }
  ]

  namespace :spec do
    namespace :suite do
      SPEC_SUITES.each do |suite|
        desc "Run all specs in #{suite[:title]} spec suite"
        RSpec::Core::RakeTask.new(suite[:id]) do |t|
          spec_files = []
          if suite[:files]
            suite[:files].each { |glob| spec_files += Dir[glob] }
          end

          if suite[:dirs]
            suite[:dirs].each { |glob| spec_files += Dir["#{glob}/**/*_spec.rb"] }
          end

          t.rspec_opts = ['--options', "\"#{Rails.root}/.rspec\""]
          t.pattern = spec_files
        end
      end
    end
  end
end
