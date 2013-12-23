class HomeController < ApplicationController
  after_action :cache_index
  caches_page :policy

  private

  def cache_index
    cache_page(nil, "/#{I18n.locale}/index.html")
  end
end
