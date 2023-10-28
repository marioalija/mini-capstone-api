Rails.application.routes.draw do
  get "/all_products" => "products#index"
  get "/products/:id" => "products#show"
end
