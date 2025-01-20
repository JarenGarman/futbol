require_relative 'spec_helper'

RSpec.describe StatTracker do
    subject(:tracker) do
    StatTracker.from_csv({
                           games: './data/games.csv',
                           teams: './data/teams.csv',
                           game_teams: './data/game_teams.csv'
                         })
    end

    describe '#from_csv' do
        it { is_expected.to be_instance_of StatTracker }

        it 'has games' do
            expect(tracker.games.all?(Game)).to be true
        end

        it 'has teams' do
            expect(tracker.teams.all?(Team)).to be true
        end

        it 'has game_teams' do
            expect(tracker.game_teams.all?(GameTeam)).to be true
        end

        it 'has game_stats' do
            expect(tracker.game_stats).to be_instance_of GameStats
        end

        it 'has league_stats' do
            expect(tracker.league_stats).to be_instance_of LeagueStats
        end

        it 'has season_stats' do
            expect(tracker.season_stats).to be_instance_of SeasonStats
        end
    end

    describe 'stat methods' do 
        it "#highest_total_score" do
            expect(tracker.highest_total_score).to eq 11
        end

        it "#lowest_total_score" do
            expect(tracker.lowest_total_score).to eq 0
        end

        it "#percentage_home_wins" do
            expect(tracker.percentage_home_wins).to eq 0.44
        end

        it "#percentage_visitor_wins" do
            expect(tracker.percentage_visitor_wins).to eq 0.36
        end

        it "#percentage_ties" do
            expect(tracker.percentage_ties).to eq 0.20
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
            expect(tracker.count_of_games_by_season).to eq expected
        end

        it "#average_goals_per_game" do
            expect(tracker.average_goals_per_game).to eq 4.22
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
            expect(tracker.average_goals_by_season).to eq expected
        end

        it "#count_of_teams" do
            expect(tracker.count_of_teams).to eq 32
        end

        it "#best_offense" do
            expect(tracker.best_offense).to eq "Reign FC"
        end

        it "#worst_offense" do
            expect(tracker.worst_offense).to eq "Utah Royals FC"
        end

        it "#highest_scoring_visitor" do
            expect(tracker.highest_scoring_visitor).to eq "FC Dallas"
        end

        it "#highest_scoring_home_team" do
            expect(tracker.highest_scoring_home_team).to eq "Reign FC"
        end

        it "#lowest_scoring_visitor" do
            expect(tracker.lowest_scoring_visitor).to eq "San Jose Earthquakes"
        end

        it "#lowest_scoring_home_team" do
            expect(tracker.lowest_scoring_home_team).to eq "Utah Royals FC"
        end

        it "#winningest_coach" do
            expect(tracker.winningest_coach("20132014")).to eq "Claude Julien"
            expect(tracker.winningest_coach("20142015")).to eq "Alain Vigneault"
        end

        it "#worst_coach" do
            expect(tracker.worst_coach("20132014")).to eq "Peter Laviolette"
            expect(tracker.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
        end

        it "#most_accurate_team" do
            expect(tracker.most_accurate_team("20132014")).to eq "Real Salt Lake"
            expect(tracker.most_accurate_team("20142015")).to eq "Toronto FC"
        end

        it "#least_accurate_team" do
            expect(tracker.least_accurate_team("20132014")).to eq "New York City FC"
            expect(tracker.least_accurate_team("20142015")).to eq "Columbus Crew SC"
        end

        it "#most_tackles" do
            expect(tracker.most_tackles("20132014")).to eq "FC Cincinnati"
            expect(tracker.most_tackles("20142015")).to eq "Seattle Sounders FC"
        end

        it "#fewest_tackles" do
            expect(tracker.fewest_tackles("20132014")).to eq "Atlanta United"
            expect(tracker.fewest_tackles("20142015")).to eq "Orlando City SC"
        end
    end
end
