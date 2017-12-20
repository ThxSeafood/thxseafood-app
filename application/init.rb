# frozen_string_literal: false

folders = %w[representers services views controllers]
folders.each do |folder|
  require_relative "#{folder}/init.rb"
end
