class HomeController < ApplicationController
  layout 'base'
  #after_action :cache_index, only: [:index]
  def index
    prepare_speakers
  end

  private

  #def cache_index
  #  cache_page(nil, "/#{I18n.locale}/index.html")
  #end

  def prepare_speakers
    @speakers = [
        {
            name: 'Kamil Gałuszka', title: 'Python Developer',
            #description: 'Kamil is working as Python/JavaScript developer on daily basis. In his free time he is trying to be involved in open source community. In not so free time he happen to be working with very skilled team mates in Solution4Future. Kamil believe that meeting great people can sharpen your skills so he is organizing meetjs meetup in Katowice with friends in Cowbell Labs. You can also meet him on PySilesia which is Silesia Python User Group.',
            #description: 'Kamil na codzień pracuje jako Python/JavaScript developer. W czasie wolnym angażuję się w działania społeczności Open Sourcy. W nie tak dokońca wolnym czasie, mam przyjemność pracować z bardzo utalentowanymi kolegami w Solution4Future. Kamil jest przekonany iż spotkania z wspaniałymi ludźmi mogą ulepszyć posiadane umiejętności, dlatego też organizuje meetjs meetup w Katowicach wspólnie z kolegami z Cowbell Labs. Można go również spotkać na PySilesia - śląskiej grupie używkowników Python. Ponadto Kamil stara się być aktywny w społecznościach: Mikstura.IT, Dni Wolnego Oprogramowania, Stowarzyszenie użytkowników Pythona.',
            description: "Kamil w czasie wolnym chętnie angażuje się działania społęczności Open Source",
            picture: 'Kamil_Galuszka.jpg',
            social: {twitter: 'https://twitter.com/galuszkak',
                     facebook: 'https://pl-pl.facebook.com/galuszkak',
                     google: 'https://plus.google.com/115271802415949853553/posts',
                     linkedin: 'http://pl.linkedin.com/pub/kamil-ga%C5%82uszka/4a/914/706'}
        },
        {
            name: 'Kate Terlecka', title: 'The Scrum Girl',
            #description: 'Kate Terlecka to jedna z najlepiej rozpoznawalnych twarzy polskiego Agile. Uczy Scruma i związanych z nim technik od lat, w róznych firmach, na różnych poziomach organizacyjnych i w różnych krajach. Jest związana ze Scrum.org jako oficjalny trener prawie od samego jego powstania. W Polsce działa jako założycielka i ogniwo łączące specjalistów pod parasolem inicjatywy Brass Willow, która łączy ludzi którzy mają coś ciekawego do powiedzenia i potrafią to przekazać. Prywatnie miłośniczka psów wszelakiej maści ze słabością do tych mniejszych, zapalona planszówkowiczka i miłośniczka kuchni bliskiego i dalekiego wschodu.',
            description: 'Kate Terlecka to jedna z najbardziej rozpoznawanych twarzy polskiego Agile.',
            picture: 'Kate_Terlecka.jpg',
            social: {twitter: 'https://twitter.com/kateterlecka',
                     google: 'https://plus.google.com/112917749347345443950/posts',
                     linkedin: 'http://pl.linkedin.com/pub/kate-terlecka/19/738/77a'}
        }
    ].map { |speaker| OpenStruct.new(speaker) }
  end
end
