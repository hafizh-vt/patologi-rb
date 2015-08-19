require 'rails_helper'

describe 'Notification Integration Test' do
  describe 'List Notifications' do
  	context 'no notificaiton data' do
      it 'show "no notification found" message' do
        visit 'notifications/all'
        expect(page).to have_content(/no notification found/)
      end
    end

    context '10 notification data' do
      before do
        FactoryGirl.create(:setting_true)
        10.times do
          FactoryGirl.create(:notification)
        end
      end

      it 'display 10 notification data' do
        visit 'notifications/all'
        expect(page).to have_selector('tbody tr', count: 10)
      end
    end
  end

  describe 'Clear All Notifications' do
    before do
      FactoryGirl.create(:setting_true)
      10.times do
        FactoryGirl.create(:notification)
      end
    end

    it 'clears all notifications' do
      visit 'notifications/all'
      click_link('Clear All')
      expect(page).to have_content(/no notification found/)
    end
  end
end