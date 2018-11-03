# == Route Map
#
#                   Prefix Verb   URI Pattern                       Controller#Action
#                     root GET    /                                 bank_accounts#index
#         new_user_session GET    /users/sign_in(.:format)          devise/sessions#new
#             user_session POST   /users/sign_in(.:format)          devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)         devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)     devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
#            user_password PATCH  /users/password(.:format)         devise/passwords#update
#                          PUT    /users/password(.:format)         devise/passwords#update
#                          POST   /users/password(.:format)         devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)          devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)             devise/registrations#edit
#        user_registration PATCH  /users(.:format)                  devise/registrations#update
#                          PUT    /users(.:format)                  devise/registrations#update
#                          DELETE /users(.:format)                  devise/registrations#destroy
#                          POST   /users(.:format)                  devise/registrations#create
#            bank_accounts GET    /bank_accounts(.:format)          bank_accounts#index
#                          POST   /bank_accounts(.:format)          bank_accounts#create
#         new_bank_account GET    /bank_accounts/new(.:format)      bank_accounts#new
#        edit_bank_account GET    /bank_accounts/:id/edit(.:format) bank_accounts#edit
#             bank_account GET    /bank_accounts/:id(.:format)      bank_accounts#show
#                          PATCH  /bank_accounts/:id(.:format)      bank_accounts#update
#                          PUT    /bank_accounts/:id(.:format)      bank_accounts#update
#                          DELETE /bank_accounts/:id(.:format)      bank_accounts#destroy
# 

Rails.application.routes.draw do
  root 'bank_accounts#index'
  devise_for :users

  resources :bank_accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
