require 'spec_helper'

describe AnagramsController, type: :controller do
  render_views

  describe 'GET anagrams' do
    context 'empty query' do
      it 'should be able successful' do
        get :show, :format => :json
        expect(response).to be_successful
      end

      it 'should not return data' do
        get :show, :format => :json
        expect(YAML.load(response.body)).to be_empty
      end
    end

    context 'one word in query' do
      before do
        $redis.set 'no', 'on,no'
      end

      it 'should be successful' do
        get :show, :anagrams => 'no', :format => :json
        expect(response).to be_successful
      end

      it 'should see one anagram' do
        get :show, :anagrams => 'no', :format => :json
        expect(response.body).to include('no', 'on')
        expect(YAML.load(response.body)['no'].count).to eq(2)
      end
    end

    context 'multiple words in query' do
      before do
        $redis.set 'no', 'on,no'
        $redis.set 'yes', 'yes'
      end

      it 'should be able to enter user name' do
        get :show, :anagrams => 'no,yes', :format => :json
        expect(response.body).to include('no', 'on', 'yes')
      end
    end
  end
end

