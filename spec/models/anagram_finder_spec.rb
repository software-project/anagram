require 'spec_helper'

describe User do
  subject{ User.new}

  describe 'AnagramFinder' do
    before do
      $redis.set 'no', 'on,no'
      $redis.set 'yes', 'yes'
    end

    context 'should return' do
      it 'empty array if empty' do
        expect(subject.as(AnagramFinder).find('')).to eq({})
      end

      it 'one record if there is one' do
        expect(subject.as(AnagramFinder).find('yes')['yes']).to include('yes')
      end

      it 'all records for no' do
        expect(subject.as(AnagramFinder).find('no')['no']).to include('on', 'no')
      end

      it 'all records for multiple query' do
        result = subject.as(AnagramFinder).find('no,yes')
        expect(result['no']).to include('on', 'no')
        expect(result['yes']).to include('yes')
      end
    end
  end
end