class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/recipes" do
   @recipes = Recipe.all 
   erb :index
  end

  get "/recipes/new" do
    erb :new
  end
  
  post "/recipes" do 
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    if @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      erb :new
    end
  end
  
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])

     erb :show
  end
  
  post ""

end
