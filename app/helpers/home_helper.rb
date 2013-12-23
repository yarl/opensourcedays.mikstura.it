module HomeHelper
  def i18n_switch_link
    { en: '//dwo.mikstura.it', pl: '//opensourcedays.mikstura.it'}[I18n.locale]
  end

  def i18n_switch_flag
    image_tag("layout/flags/#{{ en: 'pl', pl: 'gb'}[I18n.locale]}.png", style: "height: 16px")
  end

  def i18n_switch
    link_to i18n_switch_link do
      i18n_switch_flag
    end
  end
end
