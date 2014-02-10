class ApiInfo::About
  class << self
    def data
      {
          info: t('meta.description'),
          icons: {
              iphone: icon_path('iphone'),
              ipad: icon_path('ipad'),
              iphone_retina: icon_path('iphone-retina'),
              ipad_retina: icon_path('ipad-retina'),

          },
          links: [
              conference: domain,
              world: "",
              twitter: "",
              facebook: t('links.facebook'),
              google: ""
          ],
          audiostream: {
              icon: "",
              url: ""
          }
      }
    end

    private

    def icon_path(icon)
      link_to("assets/layout/touch/#{icon}.png")
    end

    def link_to(path)
      [domain, path].join('/')
    end

    def domain
      t(:domain)
    end

    def t(*args)
      I18n.t(args)
    end
  end
end