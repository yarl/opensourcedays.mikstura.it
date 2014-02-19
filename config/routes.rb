OpensourcedaysMiksturaIt::Application.routes.draw do
  root to: "home#index"
  get 'policy', to: "home#policy"
  get 'rules', to: "home#rules"
  get 'api', to: "home#api"
end
