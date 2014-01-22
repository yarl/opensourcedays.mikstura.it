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
end