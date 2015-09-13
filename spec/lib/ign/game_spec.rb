require 'spec_helper'

describe IGN::Game do
  describe 'Search games' do
    let(:default_options) { Hash(
      'type' => 'object',
      'objectType' => 'game',
      'filter' => 'game',
      'page' => 0,
      'count' => 10
    )}
    let(:query) { 'GTA5' }
    let(:response) { instance_double(IGN::Search, response: 'game search response') }
    let(:results) { 'parsed results' }

    before do
      expect(IGN::Game).to receive(:parse).with(response.response).and_return(results)
    end

    it 'uses default options when provides none' do
      options = HashWithIndifferentAccess.new(default_options.merge(q: query))

      expect(IGN::Search).to receive(:new).with('/search', options).and_return(response)
      expect(IGN::Game.search(query)).to eql results
    end

    it 'accepts search options' do
      custom_options = { count: 3 }
      options = HashWithIndifferentAccess.new(default_options.merge(custom_options))

      expect(IGN::Search).to receive(:new).with('/search', options.merge(q: query)).and_return(response)
      expect(IGN::Game.search(query, custom_options)).to eql results
    end

    it 'options in string and symbol are the same' do
      custom_options = { 'count' => 3 }
      options = HashWithIndifferentAccess.new(default_options.merge(count: 3))

      expect(IGN::Search).to receive(:new).with('/search', options.merge(q: query)).and_return(response)
      expect(IGN::Game.search(query, custom_options)).to eql results
    end

    it 'filters invalid query options' do
      custom_options = { count: 3, q: 'invalid query' }
      options = HashWithIndifferentAccess.new(default_options.merge(count: 3))

      expect(IGN::Search).to receive(:new).with('/search', options.merge(q: query)).and_return(response)
      expect(IGN::Game.search(query, custom_options)).to eql results
    end
  end
end
