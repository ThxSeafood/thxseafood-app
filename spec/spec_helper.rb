# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/rg'
require 'watir'
require 'headless'
# Note: Headless doesn't work on MacOS
#       Run XQuartz before trying Headless on MacOS

require './init.rb'   # to call API infrastructure helpers
require 'page-object'
require_relative 'pages/init'
HOST = 'http://localhost:9292'

# Helper methods
def homepage
  HOST
end
