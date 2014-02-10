class Person < Struct.new(:key)

  def picture
    "#{key}.jpg"
  end

  delegate :name, :title, :description, :social, to: :info

  def info
    @info ||=
        OpenStruct.new(
            I18n.translate(key, scope: [:people]))
  end

  def to_hash
    {
        name: name,
        avatar: avatar_url,
        title: title,
        description: description,
        social: social
    }
  end

  def avatar_url
    [I18n.t(:domain), 'assets/speakers', picture].join("/")
  end
end