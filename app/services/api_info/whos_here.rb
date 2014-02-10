class ApiInfo::WhosHere
  class << self
    def data
      {
          sponsors: [
              {
                  type: "gold",
                  name: "Red Hat",
                  avatar_url: "",
                  description: [
                      "one",
                      "two"
                  ],
                  links: {
                      world: "",
                      facebook: "",
                      twitter: "",
                  }
              }
          ]

      }
    end

    private

  end
end