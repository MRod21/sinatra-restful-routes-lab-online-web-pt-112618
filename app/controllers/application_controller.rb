class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/recipes"
   @recipes = Recipe.all

  get "/recipes/new"
  
  end

end
