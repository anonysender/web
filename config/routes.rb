Rails.application.routes.draw do
  root :to => "mails#new"
  resources :mails, only: [:create, :new]
end
