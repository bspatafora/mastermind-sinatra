require 'bundler/setup'
require 'sinatra'
require 'json'
require 'mastermind'

get '/' do
  haml :index
end

post '/' do
  haml :index
end

get '/api' do
  content_type :json
  JSON.generate({ code: [], rows: [{ code_peg_holes: [], key_peg_holes: [] }, { code_peg_holes: [], key_peg_holes: [] }, { code_peg_holes: [], key_peg_holes: [] }, { code_peg_holes: [], key_peg_holes: [] }, { code_peg_holes: [], key_peg_holes: [] }, { code_peg_holes: [], key_peg_holes: [] }, { code_peg_holes: [], key_peg_holes: [] }, { code_peg_holes: [], key_peg_holes: [] }, { code_peg_holes: [], key_peg_holes: [] }, { code_peg_holes: [], key_peg_holes: [] }] })
  # JSON.generate(Mastermind::JSONInterface.new_board)
end
