Rails.application.routes.draw do
root to: 'air#index'

match '/query',      to: 'air#index',        via: 'get'
end
