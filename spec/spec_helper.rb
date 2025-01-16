require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
end
require 'pry'
require 'rspec'

require_relative '../lib/game_by_team'
require_relative '../lib/game'
require_relative '../lib/stat_tracker'
require_relative '../lib/team'
require_relative '../lib/game_stats'
require_relative '../lib/league_stats'