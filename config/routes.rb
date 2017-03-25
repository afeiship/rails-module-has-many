Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :issues
  post '/issues/:issue_id/comments' => "comments#create"
end
