require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
end

require 'rspec'

require_relative '../lib/stat_tracker'
