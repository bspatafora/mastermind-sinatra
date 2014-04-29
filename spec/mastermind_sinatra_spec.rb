require_relative '../mastermind_sinatra.rb'
require 'rspec'
require 'rack/test'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }

describe 'mastermind_sinatra' do
  it "allows accessing the main page" do
    get '/'
    expect(last_response).to be_ok
  end
end
