class Talk < Struct.new(:id, :day)

  def title
    info_title ||
        I18n.t(:header, scope: [:schedule, type])
  end

  def description
    [fetch_description].flatten
  end

  # TODO - handle more then one speaker
  def speaker
    info_speaker ?
        Person.new(info_speaker) : nil
  end

  delegate :type, to: :info
  delegate :title, :description, :speaker, to: :info, prefix: true

  def start_at
    time.strftime(time_format)
  end

  def start_at_24_hour_format
    time.strftime("%H:%M")
  end

  private


  def fetch_description
    info_description ||
        I18n.t(:description, scope: [:schedule, type])
  end

  def time
    Time.parse(id.to_s.sub("-", ":"))
  end

  def time_format
    {en: "%l:%M %P", pl: "%H:%M"}[I18n.locale]
  end

  def info
    @info ||=
        OpenStruct.new(
            I18n.translate(id, scope: [:schedule, day, :agenda]))
  end
end