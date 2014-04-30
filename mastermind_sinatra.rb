require 'bundler/setup'
require 'sinatra'
require 'json'
require 'mastermind'

get '/' do
  haml :index
end

get '/new_board' do
  content_type :json
  new_board = Mastermind::Board.new
  JSON.generate(Mastermind::JSONInterface.generate_structure_from(new_board))
end

post '/send' do
  content_type :json
  board_structure = JSON.parse(request.body.read, :symbolize_names=>true)
  board = Mastermind::JSONInterface.generate_board_from(board_structure)
  computer = Mastermind::Computer.new(board)
  Mastermind::JSONInterface.send_guess(board, computer.solicit_guess)
  JSON.generate(Mastermind::JSONInterface.generate_structure_from(board))
end
