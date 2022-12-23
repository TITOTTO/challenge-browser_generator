# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/website_generator'

RSpec.describe WebsiteGenerator do
  let(:youtube_boxe) { described_class.new('youtube', 'boxe francaise') }
  let(:youtube_cs) { described_class.new('youtube', 'counter strike') }
  let(:google_boxe) { described_class.new('google', 'boxe francaise') }
  let(:google_cs) { described_class.new('google', 'counter strike') }
  let(:amazon_boxe) { described_class.new('amazon', 'boxe francaise') }
  let(:amazon_cs) { described_class.new('amazon', 'counter strike') }
  let(:github_boxe) { described_class.new('github', 'boxe francaise') }
  let(:github_cs) { described_class.new('github', 'counter strike') }

  context 'shared tests' do
    random_website_name = %w[youtube github amazon google].sample
    random_website = described_class.new(random_website_name, 'boxe francaise')
    it { expect { random_website.url }.not_to raise_error }
    it { expect(random_website.url).to be_a String }
  end

  context 'youtube generator' do
    it { expect(youtube_boxe.url).to eq 'https://www.youtube.com/results?search_query=boxe+francaise' }
    it { expect(youtube_cs.url).to eq 'https://www.youtube.com/results?search_query=counter+strike' }
  end

  context 'google generator' do
    it { expect(google_boxe.url).to eq 'https://www.google.com/search?q=boxe+francaise' }
    it { expect(google_cs.url).to eq 'https://www.google.com/search?q=counter+strike' }
  end

  context 'amazon generator' do
    it { expect(amazon_boxe.url).to eq 'https://www.amazon.fr/s?k=boxe+francaise' }
    it { expect(amazon_cs.url).to eq 'https://www.amazon.fr/s?k=counter+strike' }
  end

  context 'github generator' do
    it { expect(github_boxe.url).to eq 'https://github.com/search?q=boxe+francaise' }
    it { expect(github_cs.url).to eq 'https://github.com/search?q=counter+strike' }
  end

  context 'when wrong input' do
    it { expect { described_class.new('bonjour', 'bonjour') }.to raise_error(StandardError) }
    it { expect { described_class.new('youtube', true) }.to raise_error(StandardError) }
  end
end
