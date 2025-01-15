require_relative 'spec_helper'

RSpec.describe StatTracker do
  subject(:tracker) { StatTracker.new }

  describe '#initialize' do
    it { is_expected.to be_instance_of StatTracker }

    it 'has no games' do
      expect(tracker.games).to eq([])
    end

    it 'has no teams' do
      expect(tracker.teams).to eq([])
    end

    it 'has no game_teams' do
      expect(tracker.game_teams).to eq([])
    end
  end

  # describe '#from_csv' do
  #   it 'returns instance of StatTracker' do
  #     expect(StatTracker.from_csv({ teams: './data/teams.csv' })).to be_instance_of StatTracker
  #   end
  # end
end
