Rails.application.routes.draw do
  root "home#index"
  get "aboutus", to: "home#aboutus"
  get "signup", to: "users#new"
  get "register", to: "hosptals#new"
  get "utable", to: "users#utable"
  get "htable", to: "hosptals#htable"
  get "requesttable", to: "hosptals#requesttable"
  get "aboutus", to: "home#aboutus"
  get "bookslot", to: "users#bookslot"
  get "uprofile", to: "users#uprofile"
  get "certificate", to: "users#certificate"
  

  # get "getcerti", to: "users#show"

  
  get "/grantvac/:id", to: "users#grantvac"
  
  get "/grantvacs/:id", to: "users#grantvacs"
  

  

  get "/bookfree/:id", to: "hosptals#updatefree"
  get "/bookpaid/:id", to: "hosptals#updatepaid"

  get "/fullfilorderfree/:id", to: "hosptals#fullfilorderfree"
  get "/fullfilorderpaid/:id", to: "hosptals#fullfilorderpaid"

  
  get "/minusonefree/:id", to: "hosptals#minusonefree"
  get "/minusonepaid/:id", to: "hosptals#minusonepaid"
  get "/minustenfree/:id", to: "hosptals#minustenfree"
  get "/minustenpaid/:id", to: "hosptals#minustenpaid"


  get "/confirmuser/:username", to: "hosptals#checkuser"

  get "confirm", to: "hosptals#confirm"
  post "checkuser", to: "hosptals#checkuser"
  

  
  
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "adminlogin", to: "sessions1#new"
  post "adminlogin", to: "sessions1#create"
  delete "adminlogout", to: "sessions1#destroy"

  get "sadminlogin", to: "sessions2#new"
  post "sadminlogin", to: "sessions2#create"
  delete "sadminlogout", to: "sessions2#destroy"

  
  resources :users, except: [:new]
  resources :hosptals, except: [:new]
  resources :admins, except: [:new]
  resources :sadmins, except: [:new]
end
