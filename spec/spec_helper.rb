require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
]
SimpleCov.start do
  add_filter "/spec/"
end

require 'discourse_api'
require 'rspec'
require 'webmock/rspec'

# Require spec helpers
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each {|file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  
  config.include ClientHelper
end

WebMock.disable_net_connect!

def a_delete(client, path)
  a_client_request(client, :delete, path)
end

def a_get(client, path)
  a_client_request(client, :get, path)
end

def a_post(client, path)
  a_client_request(client, :post, path)
end

def a_put(client, path)
  a_client_request(client, :put, path)
end

def a_client_request(client, method, path)
  a_request(method, path).with(query: {api_key: client.api_key, api_username: client.api_username})
end

def stub_delete(client, path)
  stub_client_request(client, :delete, path)
end

def stub_get(client, path)
  stub_client_request(client, :get, path)
end

def stub_post(client, path)
  stub_client_request(client, :post, path)
end

def stub_put(client, path)
  stub_client_request(client, :put, path)
end

def stub_client_request(client, method, path)
  stub_request(method, path).with(query: {api_key: client.api_key, api_username: client.api_username})
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
