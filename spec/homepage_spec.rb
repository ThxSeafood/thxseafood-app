# frozen_string_literal: true

require_relative 'spec_helper'

describe 'Homepage' do
  before do
    unless @browser
      ThxSeafood::ApiGateway.new.delete_all_jobs
      @headless = Headless.new
      @browser = Watir::Browser.new
    end
  end

  after do
    @browser.close
    @headless.destroy
  end

  describe 'Empty Homepage' do
    it '(HAPPY) should see no content' do
      # GIVEN: user is on the home page without any projects
      @browser.goto homepage

      # THEN: user should see basic headers, no projects and a welcome message
      _(@browser.h1(id: 'main_header').text).must_equal 'ThxSeafood'
      _(@browser.table(id: 'jobs_table').exists?).must_equal false

      _(@browser.div(id: 'flash_bar_success').visible?).must_equal true
      _(@browser.div(id: 'flash_bar_success').text).must_include 'Add'
    end
  end


end
