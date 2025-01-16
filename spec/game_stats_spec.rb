require_relative 'spec_helper'

RSpec.describe GameStats do
    subject(:game_stats) { GameStats.new([])}
    

    describe '#initialize' do 
        it { is_expected.to be_instance_of GameStats }
    end

    it 'has games' do 
        expect(game_stats.games).to be_an(Array)

    end

end