require 'spec_helper'

describe 'Real search request' do
  let(:name) { 'Grand Theft Auto V' }
  let(:id) { '20594' }
  let(:rating) { 10.0 }
  let(:handle) { 'grand-theft-auto-v' }
  let(:platforms) { ["PS3", "Xbox 360", "PS4", "Xbox One", "PC"] }
  let(:publisher) { 'Rockstar  Games' }
  let(:release_date) { 'September 17, 2013' }
  let(:thumb) { 'http://assets2.ignimgs.com/2013/08/07/gtavps3finaljpg-e937ba_160w.jpg' }

  it 'returns game results from IGN' do
    skip "Use SEARCH_ON_IGN=true to run this test" unless ENV['SEARCH_ON_IGN']
    game = IGN::Game.search('GTA5').first

    expect(game.name).to eql name
    expect(game.id).to eql id
    expect(game.rating).to eql rating
    expect(game.handle).to eql handle
    expect(game.platforms).to eql platforms
    expect(game.release_date).to eql release_date
    expect(game.thumb).to eql thumb
    expect(game.description).to_not be_nil
  end
end
