require_relative 'spec_helper'

RSpec.describe SeasonStats do
    subject(:season_stats) { SeasonStats.new([])}
    

    describe '#initialize' do 
        it { is_expected.to be_instance_of SeasonStats }
    end

    it 'has games' do 
        expect(season_stats.game_teams).to be_an(Array)

    end
end