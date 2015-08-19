require 'rails_helper'

describe 'SMS Integration Test' do
  describe 'List SMS' do
    context 'no sms data' do
      it 'show "no sms found" message' do
        visit 'sms'
        expect(page).to have_content(/no sms found/)
      end
    end

    context '10 sms data' do
      before do
        10.times do
          FactoryGirl.create(:sms_true)
        end
      end

      it 'displays 10 sms data' do
        visit 'sms'
        expect(page).to have_selector('tbody tr', count: 10)
      end
    end
  end

  describe 'Clear All SMS' do
    before do
      10.times do
        FactoryGirl.create(:sms_true)
      end
    end

    it 'clears all sms' do
      visit 'sms'
      click_link('Clear All')
      expect(page).to have_content(/no sms found/)
    end
  end
end