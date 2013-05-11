#encoding: utf-8
require 'spec_helper'

describe "sign up and login", :type => :feature do
  it "let user sign up and login to the site with name" do
    visit new_user_session_path
    click_link '注册'
    fill_in '用户名', :with => 'example'
    fill_in 'Email', :with => 'example@caok1231.com'
    fill_in '* 密码', :with => 'password'
    fill_in '确认密码', :with => 'password'
    click_button I18n.t('devise.views.registrations.new.submit')
    page.should have_content('欢迎您！您已注册成功.')
    within("#userbar") do
      click_on 'example'
    end

    click_link '退出'
    page.should have_content('退出成功.')

    click_link '登录'
    fill_in '登录名', :with => 'example'
    fill_in '密码', :with => 'password'
    click_button I18n.t('devise.views.sessions.new.submit')
    page.should have_content('登录成功.')
  end

  it "let user sign up and login to the site with email" do
    visit new_user_session_path
    click_link '注册'
    fill_in '用户名', :with => 'demo'
    fill_in 'Email', :with => 'demo@caok1231.com'
    fill_in '* 密码', :with => 'password'
    fill_in '确认密码', :with => 'password'
    click_button I18n.t('devise.views.registrations.new.submit')
    page.should have_content('欢迎您！您已注册成功.')
    within("#userbar") do
      click_on 'demo'
    end

    click_link '退出'
    page.should have_content('退出成功.')

    click_link '登录'
    fill_in '登录名', :with => 'demo@caok1231.com'
    fill_in '密码', :with => 'password'
    click_button I18n.t('devise.views.sessions.new.submit')
    page.should have_content('登录成功.')
  end
end
