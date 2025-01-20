require_relative 'lib/stat_tracker'
require 'pry'

stat_tracker = StatTracker.from_csv({
                                      games: './data/games.csv',
                                      teams: './data/teams.csv',
                                      game_teams: './data/game_teams.csv'
                                    })

binding.pry
