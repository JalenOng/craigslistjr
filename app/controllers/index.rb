get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/cool_url' do
  puts "[LOG] Getting /cool_url"
  puts "[LOG] Params: #{params.inspect}"
  erb :create_posting_in_category
end

post '/categories' do
  # byebug
  @id = params["category"]


  redirect to("/categories/#{@id}/posts")
  # erb :postings_in_category
end

get '/categories/:id/posts' do
  @name = Category.find(params["id"]).name
  # byebug
  erb :postings_in_category
end

post '/categories/:id/posts/key' do
  @a = Post.create(title: params["post"]["title"], poster: params["post"]["poster"], key: Faker::Bitcoin.address, category_id: params[:id] )
  # redirect to("/#{@key}")
  redirect to("/posts/#{@a.id}/#{@a.category_id}/key")
end

get '/posts/:id/:category_id/key' do
  @post = Post.find(params[:id])
  erb :display_key
end

get '/posts/:post_id/edit/:key' do
  # if Post.find(params[:post_id]) == Post.where(key: params[:key]).take
  puts "[LOG] Getting /edit/:key"
  puts "[LOG] Params: #{params.inspect}"
  if Post.where(key: params[:key]) == []
    puts "ERROR ERROR"
  else
    erb :edit_post
  end
end

post '/editedpost/:post_id' do
  puts "[LOG] Getting /editedpost"
  puts "[LOG] Params: #{params.inspect}"

  post = Post.find(params["post_id"])
  post.title = params["title"]
  post.save
  puts post

  erb :index
end






#  redirect to("/categories/:id/posts/:key")
# end
 # redirect to("/?aunty=#{reply}")