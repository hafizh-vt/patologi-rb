require 'rails_helper'

describe NotificationsController do
  describe 'GET #index' do
    it 'assigns @count'
    it 'renders index template'
  end

  describe 'POST #create' do
    it 'saves new notification with flag = true to database'
  end

  describe 'POST #create_error' do
    it 'saves new notification with flag = false to database'
  end

  describe 'DELETE #clear' do
    it 'deletes all notification in database'
    context 'respond_to html' do
      it 'redirects to #all'
    end
    context 'respond_to json' do
      it 'return status OK'
    end
  end

  describe 'GET #all' do
    it 'assigns @notifications' do
      get :all
      expect(assigns(:notifications)).to_not be_nil
    end

    it 'renders all template'
  end

  describe 'GET #show' do
    it 'assigns @notifications'
    it 'renders show template'
  end

  describe 'POST #notify' do
    context 'notif status setting is set to true' do
      it 'save notification to databse'
      it 'return status OK'
    end
    context 'notif status setting is set to false' do
      it 'return status Not OK'
    end
  end

  describe 'PUT #toggle' do
    it 'set notification status setting to its opposite value'
  end

  describe 'PUT #set_status' do
    it 'set notification status based on params'
  end

  describe 'GET #show_notification_status_setting' do
    it 'return notification status setting'
  end
end