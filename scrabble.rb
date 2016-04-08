require 'sinatra'
require_relative 'lib/score_one'

class MyApp < Sinatra::Base

  get '/' do
    @page_title = "Home"
    erb :index
  end

  get '/score' do
    @page_title = "Score a Word"
    erb :score
  end

  get '/score_many' do
    @page_title = "Score Lots of Words!"
    erb :score_many
  end

  post '/score_many' do
    @page_title = "Score Lots of Words!"
    @words = Scoring::Words.new(params["many_form"])
    erb :score_many
  end

  post '/score' do
    @page_title = "Score a Word"
    @word = Scoring::Word.new(params["word_to_score"]["word"])
    erb :score
  end

  run!
end
