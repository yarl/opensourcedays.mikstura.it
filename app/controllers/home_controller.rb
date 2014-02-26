class HomeController < ApplicationController
  layout 'base'
  after_action :cache_it, only: [:index, :rules, :policy]
  after_action :cache_json, only: [:api]

  def index
    prepare_team
    prepare_speakers
    prepare_talks
  end

  def rules
    render template: '/legal/rules', layout: 'plain'
  end

  def policy
    render template: '/legal/policy', layout: 'plain'
  end

  def api
    render json: MobileApi.data,
           root: false
  end

  private

  def cache_it
    cache_page(nil, "/#{I18n.locale}/#{action_name}.html")
  end

  def cache_json
    cache_page(nil, "/#{I18n.locale}/#{action_name}.json")
  end

  def prepare_speakers
    @speakers = %w(Aaron_Kaplan Kate_Terlecka Kamil_Galuszka Dariusz_Wylon Michal_Wyrobek Mikolaj_Pastuszko Rafal_Jagoda Anna_Warzecha Arkadiusz_Benedykt Marcin_Szalowicz Pawel_Marynowski Arkadiusz_Kwasny Tomasz_Mloduchowski Agnieszka_Pawlicka Karol_Ryt Carsten_Munk Bartosz_Piec Stanislaw_Klekot Henryk_Konsek Grzegorz_Nosek Tomasz_Bak Wojtek_Ryrych).
        map { |speaker| Person.new(speaker) }
  end

  def prepare_team
    @team = %w(Dominik_Kozaczko Eunika_Tabak Dariusz_Wylon Michal_Czyz Tomasz_Gancarczyk Grzegorz_Rduch).map { |speaker| Person.new(speaker) }
  end

  def prepare_talks
    @talks = [:dayone, :daytwo, :daythree].each_with_object({}) do |day, cache|
      cache[day] = I18n.t(:agenda, scope: [:schedule, day]).keys.map(&:to_s).sort.collect do |agenda_key|
        Talk.new(agenda_key, day)
      end
    end
  end
end
