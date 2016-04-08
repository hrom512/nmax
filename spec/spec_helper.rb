require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'shared', '**', '*.rb'))].each { |f| require f }

require 'hrom512/nmax'
