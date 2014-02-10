class MobileApi
  def self.data
    {
        about: ApiInfo::About.data,
        schedule: ApiInfo::Schedule.data,
        workshops: ApiInfo::Workshops.data,
        whos_here: ApiInfo::WhosHere.data
    }
  end
end