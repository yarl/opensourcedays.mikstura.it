class HomeController < ApplicationController
  layout 'base'
  #after_action :cache_index, only: [:index]

  private

  #def cache_index
  #  cache_page(nil, "/#{I18n.locale}/index.html")
  #end
end
