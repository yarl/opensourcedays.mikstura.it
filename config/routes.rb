OpensourcedaysMiksturaIt::Application.routes.draw do
  root to: "home#index"
  get 'policy', to: "home#policy"
end
