require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
   erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
   end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save

    redirect '/'
  end

  get '/gossips/:id/' do
    erb :show, locals: {gossip_selected: Gossip.find(params[:id])}
  end

  post '/gossips/:id/' do
    Gossip.new(params["gossip_author"],params["gossip_content"], params["comment"]).comment(params["comment"],params[:id],params["user_comment"])
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
