require_relative 'spec_helper'

RSpec.describe GameStats do
    subject(:game_stats) do
        StatTracker.from_csv({
                               games: './data/games.csv',
                               teams: './data/teams.csv',
                               game_teams: './data/game_teams.csv'
                             }).game_stats
    end

    describe '#initialize' do
        it { is_expected.to be_instance_of GameStats }

        it 'has games' do
            expect(game_stats.games.all?(Game)).to be true
        end
    end

    describe 'statistics methods' do
        it '#highest_total_score' do
            expect(game_stats.highest_total_score).to eq(11)
        end

        it '#lowest_total_score' do
            expect(game_stats.lowest_total_score).to eq(0)
        end

        it '#percentage_home_wins' do
            expect(game_stats.percentage_home_wins).to eq(0.44)
        end

        it '#percentage_visitor_wins' do
            expect(game_stats.percentage_visitor_wins).to eq(0.36)
        end
       
        it '#percentage_ties' do 
            expect(game_stats.percentage_ties).to eq(0.20)
        end
    

        it "#count_of_games_by_season" do
            expected = {
            "20122013"=>806,
            "20162017"=>1317,
            "20142015"=>1319,
            "20152016"=>1321,
            "20132014"=>1323,
            "20172018"=>1355
            }
            expect(game_stats.count_of_games_by_season).to eq(expected)
        end

        it "#average_goals_per_game" do 
            expect(game_stats.average_goals_per_game).to eq(4.22)
        end

        it "#average_goals_by_season" do 
            expected = {
            "20122013"=>4.12,
            "20162017"=>4.23,
            "20142015"=>4.14,
            "20152016"=>4.16,
            "20132014"=>4.19,
            "20172018"=>4.44
            }
            expect(game_stats.average_goals_by_season).to eq(expected)
        end
    end
end
