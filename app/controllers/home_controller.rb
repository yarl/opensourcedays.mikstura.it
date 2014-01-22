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
    break_time = {
        type: :break, title: t('schedule.break.header'),
        speaker: nil,
        description: t('schedule.break.description')
    }
    @talks = {
        dayone: [
            {start_at: '15:00', type: :registration, title: t('schedule.registration.header'), speaker: nil,
             description: t('schedule.registration.description')},
            {start_at: '16:00', type: :welcome, title: t('schedule.welcome.header'), speaker: 'Dominik Kozaczko',
             description: t('schedule.welcome.description')},
            {start_at: '16:30', type: :talk, title: 'Wprowadzenie do świata free & Open Source',
             speaker: 'Kamil Gałuszka',
             description: 'Open Source jest czymś co zmieniło i zmienia świat. Chcę pokazać jak Ty drogi uczestniku możesz zaangażować się w świat otwartego kodu budowanego przez społeczność wielu niesamowitych ludzi.'
            }, {
                start_at: '16:50', type: :talk, title: 'A więc chciałbyś zostać Hakerem',
                speaker: 'Michał Czyż',
                description: ' '},
            {
                start_at: '17:10', type: :talk, title: 'Czy można zaprogramować człowieka?',
                speaker: 'Dariusz Wylon',
                description: 'Chcesz dowiedzieć się co zrobić, aby osoby w Twoim otoczeniu lepiej rozmiały to co chcesz im przekazać. Chcesz sprawić, aby wypowiadane przez Ciebie  komunikaty były bardziej skuteczne. Co prawda nie powiem jak zaprogramować człowieka aby zrobił to co chcemy, ale chętnie podzielę się z Tobą wiedzą na temat komunikacji międzyludzkiej, która dotychczas dostępna była jedynie na najlepszych szkoleniach.'},
            break_time.merge({
                                 start_at: '17:30'}),
            {
                start_at: '18:00', type: :keynote, title: 'Scrum - czyli jak poddać się zmianom i zrobić swoje',
                speaker: 'Kate Terlecka',
                description: 'Scrum to ostatnio bardzo mądre słowo. Ale w Polsce spotkałam dopiero 4 firmy, które na prawdę wiedzą o co w tym chodzi. Chcę wam przybliżyć co to jest Scrum i dlaczego jeśli już go wprowadzamy, to zapominamy o jego sercu.'},
            break_time.merge({
                                 start_at: '19:00'
                             }),
            {
                start_at: '19:15', type: :panel, title: 'Panel Dyskusyjny: "Kariera IT"',
                speaker: '[]',
                description: ' '}
        ].map { |talk| OpenStruct.new(talk) },
        daytwo: [
            {
                start_at: '08:30', type: :breakfest, title: t('schedule.breakfest.header'),
                speaker: nil,
                description: t('schedule.breakfest.description')
            },
            {
                start_at: '09:45', type: :welcome, title: t('schedule.welcome.header'),
                speaker: 'Dariusz Wylon',
                description: t('schedule.welcome.description')},
            {
                start_at: '10:00', type: :keynote, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            break_time.merge(start_at: '11:00'),
            {
                start_at: '11:30', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '11:50', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '12:10', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '12:30', type: :lunch, title: t('schedule.lunch.header'),
                speaker: nil,
                description: t('schedule.lunch.description')
            },
            {
                start_at: '13:30', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '13:50', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '14:10', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            break_time.merge(start_at: '14:30'),
            {
                start_at: '15:00', type: :ligthingtalks, title: 'Lightning Talks',
                speaker: nil,
                description: 'TBA'
            },
            break_time.merge(start_at: '16:00'),
            {
                start_at: '16:30', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '16:50', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '17:10', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            break_time.merge(start_at: '17:30'),
            {
                start_at: '18:00', type: :keynote, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
        ].map { |talk| OpenStruct.new(talk) },
        daythree: [
            {
                start_at: '08:30', type: :breakfest, title: t('schedule.breakfest.header'),
                speaker: nil,
                description: t('schedule.breakfest.description')
            },
            {
                start_at: '09:45', type: :welcome, title: t('schedule.welcome.header'),
                speaker: 'Eunika Tabak',
                description: t('schedule.welcome.description')},
            {
                start_at: '10:00', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '10:20', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '10:40', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            break_time.merge(start_at: '11:00'),
            {
                start_at: '11:30', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '11:50', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '12:10', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            break_time.merge(start_at: '12:30'),
            {
                start_at: '13:00', type: :talk, title: 'TBA',
                speaker: nil,
                description: 'TBA'
            },
            {
                start_at: '14:00', type: :talk, title: t('schedule.bye.header'),
                speaker: 'Dariusz Wylon',
                description: t('schedule.bye.description')
            }
        ].map { |talk| OpenStruct.new(talk) }
    }
  end
end
