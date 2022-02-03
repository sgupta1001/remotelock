require 'spec_helper'

#######################################################
# Percent Parser Class specs#
#######################################################
RSpec.describe 'Percent Parser specs' do
  describe 'parse' do
    let(:percent_format) {
      File.read('spec/fixtures/people_by_percent.txt').split(/\n/)
    }
    let(:percent_parser) { Parser::Percent.new(percent_format) }

    it 'parses percent file data' do
      percent_parsed_data = percent_parser.parse

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(percent_parsed_data).to eq [
        'Mckayla, Atlanta, 5/29/1986',
        'Elliot, New York City, 5/4/1947',
      ]
    end
  end

  describe 'date_format' do
    let(:birthdate) {'1947-05-04'}
    let(:percent_parser) { Parser::Percent.new([]) }
    it 'returns birthdate in M/D/YYYY date_format' do
      expect(percent_parser.send(:date_format, birthdate)).to(eq('5/4/1947'))
    end
  end
end
