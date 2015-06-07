$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'paint_cli'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new
