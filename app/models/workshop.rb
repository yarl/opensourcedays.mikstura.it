class Workshop < Struct.new(:id, :date)

  def title
    info_title
  end

  def description
    [info_description].flatten
  end

  delegate :name, :code, to: :place, prefix: true

  def place
    OpenStruct.new(
        I18n.t(info_where, scope: [:venue, :places]))
  end

  delegate :name, :picture, to: :lead, prefix: true

  def lead
    info_lead ?
        Person.new(info_lead) : nil
  end

  delegate :type, :logo, to: :info
  delegate :where, :title, :description, :lead, to: :info, prefix: true

  def to_hash
    {
        id: info.id,
        more_info: true,
        start_at: start_at,
        type: type,
        title: title,
        description: description,
        speakers: [speaker].flatten.compact.map(&:to_hash)
    }
  end

  private

  def info
    @info ||=
        OpenStruct.new(
            I18n.translate(id, scope: [:workshops]))
  end
end