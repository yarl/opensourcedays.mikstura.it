class HomeController < ApplicationController
  layout 'base'
  after_action :cache_index, only: [:index]

  def index
    prepare_team
    prepare_speakers
    prepare_talks
  end

  private

  def cache_index
    cache_page(nil, "/#{I18n.locale}/index.html")
  end

  def prepare_speakers
    @speakers = %w(Kamil_Galuszka Kate_Terlecka Dariusz_Wylon).map { |spekaer| Person.new(spekaer) }
  end

  def prepare_team
    @team = %w(Dominik_Kozaczko Eunika_Tabak Dariusz_Wylon Michal_Czyz Tomasz_Gancarczyk Grzegorz_Rduch).map { |spekaer| Person.new(spekaer) }
  end

  def prepare_talks
    @talks = [:dayone, :daytwo, :daythree].each_with_object({}) do |day, cache|
      cache[day] = I18n.t(:agenda, scope: [:schedule, day]).keys.map(&:to_s).sort.collect do |agenda_key|
        Talk.new(agenda_key, day)
      end
    end
  end
end
