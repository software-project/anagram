require 'spec_helper'

describe 'Main page', :js => true do
  context 'I should see a main age' do
    before do
      visit '/'
    end

    it 'page should load' do
      expect(page).to have_content('Anagrams')
    end
  end


  context 'when I pass words in query' do
    before do
      $redis.set 'no', 'on,no'
      $redis.set 'yes', 'yes'
      visit '/no,yes'
    end

    it 'should display no and yes anagrams' do
      expect(page).to have_css('span.label.label-success')
    end
  end
end