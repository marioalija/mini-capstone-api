Rails.application.routes.draw do
  get "/all_products" => "products#index"
end
