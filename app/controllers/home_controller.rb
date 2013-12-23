class HomeController < ApplicationController
  after_action :cache_index

  private

  def cache_index
    cache_page(nil, "/#{I18n.locale}/index.html")
  end
end
