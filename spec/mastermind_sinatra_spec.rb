require_relative '../mastermind_sinatra.rb'
require 'rspec'
require 'rack/test'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }

describe 'mastermind_sinatra' do
  before do
    new_board = Mastermind::Board.new
    @new_board_structure = Mastermind::JSONInterface.generate_structure_from(new_board)
    @JSON_board = JSON.generate(@new_board_structure)
  end

  it "gets a page with a board" do
    get '/'
    expect(last_response.body).to include("<table id='board'>")
  end

  it "gets a JSON new board" do
    get '/new_board'
    expect(JSON.parse(last_response.body, :symbolize_names=>true)).to eql(@new_board_structure)
  end

  it "accepts a JSON board post" do
    body = @JSON_board
    post '/send', body, {'Content-Type' => 'application/json'}
    expect(last_response).to be_ok
  end
end
