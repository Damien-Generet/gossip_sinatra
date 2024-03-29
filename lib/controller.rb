require 'gossip'
require 'comment'
class ApplicationController < Sinatra::Base
  get '/' do
   erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip                         #* ALL GET show the page erb we want
   end                                      #* ALL POST received information of a submit and do something with it

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save

    redirect '/'
  end

  get '/gossips/:id/' do 
    erb :show, locals: {gossip_selected: Gossip.find(params['id']), comments: Comment.all_with_id(params[:id].to_i)}
  end

  post '/gossips/:id/' do 
		Comment.new(params['id'].to_i, params["gossip_comment"]).save
    redirect '/'
  end

  get '/gossips/:id/edit/' do
    erb :edit, locals: {gossip_selected: Gossip.find(params[:id])}
  end

  post '/gossips/:id/edit/' do
    Gossip.update(params["update_author"], params["update_content"], params[:id])
    redirect '/'
  end

end

