require_relative 'spec_helper'

RSpec.describe LeagueStats do
    subject(:league_stats) { LeagueStats.new([], []) }

    describe '#initialize' do
        it { is_expected.to be_instance_of LeagueStats }
    end

    it 'has games' do
        expect(league_stats.games).to be_an(Array)
    end
end
