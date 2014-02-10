class ApiInfo::Schedule
  class << self
    def data
      collect_talks
    end

    private

    def collect_talks
      [:dayone, :daytwo, :daythree].collect do |day|
        {
            date: t(:date, scope: [:schedule, day]),
            label: t(:header, scope: [:schedule, day]),
            talks: t(:agenda, scope: [:schedule, day]).keys.map(&:to_s).sort.collect do |agenda_key|
              Talk.new(agenda_key, day).to_hash
            end
        }
      end
    end

    def t(*args)
      I18n.t(*args)
    end
  end
end