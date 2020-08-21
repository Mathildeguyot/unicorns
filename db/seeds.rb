# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

User.destroy_all
Unicorn.destroy_all
Booking.destroy_all


MAGIC_POWERS = ["ailé", "guérisseuse", "horticultrice", "yogi", "voyante"]

UNICORN_PICTURES = [
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne18_cocwmu.jpg", name: "licorne18_cocwmu.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674681/licorne12_hqqyw3.jpg" ,name: "licorne12_hqqyw3.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne13_h8av8h.jpg",name: "licorne13_h8av8h.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne8_vp7cmz.png",name: "licorne8_vp7cmz.png"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne16_oozqqe.jpg",name: "licorne16_oozqqe.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne14_oivcc7.jpg",name: "licorne14_oivcc7.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne10_biltno.jpg",name: "licorne10_biltno.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne17_zuz82y.jpg",name: "licorne17_zuz82y.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne7_makql8.jpg",name: "licorne7_makql8.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne11_mastst.jpg",name: "licorne11_mastst.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne6_we54js.jpg",name: "licorne6_we54js.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne6_we54js.jpg",name: "licorne6_we54js.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674680/licorne6_we54js.jpg",name: "licorne6_we54js.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674679/licorne2_vwc2ut.jpg",name: "licorne2_vwc2ut.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674679/licorne1_o0vj9c.jpg" ,name: "licorne1_o0vj9c.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674679/licorne5_izdkpv.jpg",name: "licorne5_izdkpv.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674679/licorne4_gronnt.jpg",name: "licorne4_gronnt.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674679/licorne3_xs9plo.jpg",name: "licorne3_xs9plo.jpg"},
  {url: "https://res.cloudinary.com/dfrtup7hb/image/upload/v1597674679/15_iayhct.jpg",name: "15_iayhct.jpg"}
]

CITIES = [
  "4 bis Passage Legrand Boulogne-Billancourt",
  "24 rue de Rivoli Paris",
  "56 Boulevard Jules Ferry, 02200 Soissons Picardie",
  "65  boulevard de Palaiseau PALAISEAU Île-de-France",
  "99, rue des Dunes 35400 SAINT-MALO",
  "74  rue de Paris, CHARENTON-LE-PONT Île-de-France",
  "106  rue Beauvau MARSEILLE Provence-Alpes-Côte d'azur",
  "15 rue la Boétie Paris Île-de-France",
  "24  rue Marechal Juin SAINT-LÔ Basse-normandie",
  "128  rue Voltaire MAISONS-ALFORT Île-de-France",
  "89 Route de Font de Ciné, 06220 Vallauris",
  "85 Chemin du Clapas, 34400 Lunel",
  "132  Rue de Strasbourg CLICHY Île-de-France",
  "50 rue de Paradis Paris 10",
  "111 Rue Réaumur, 75002 Paris",
  "110 Rue Oberkampf, 75011 Paris",
  "35 Rue du Chevalier de la Barre, 75018 Paris",
  "11 rue des Abondances boulogne-billancourt",
  "24 Rue du Commandant Guilbaud, 75016 Paris",
  "5 Rue Isabey, 75016 Paris",
  "12 avenue pierre brossolette Vincennes"
]

10.times do
  user_name = Faker::Name.first_name
  user = User.new(
    pseudo: "#{user_name}#{rand(1..99)}",
    email: Faker::Internet.email(name: user_name),
    password: Faker::Internet.password(min_length: 8, max_length: 12),
    rating: rand(2.0..4.99).round(2)
  )
  user.save
end

REVIEW_RATING = [
  {rating: 1, review: "Très deçue, son pouvoir n'est pas si efficace que ça..."},
  {rating: 2, review: "Pas ouf !"},
  {rating: 3, review: "Plutôt sympathique."},
  {rating: 4, review: "Super expérience à dos de licorne, je recommande !"},
  {rating: 5, review: "INCROYABLE ! j'ai pu visiter Paris vu du ciel !!!!"},
  {rating: 1, review: "Licorne très désagréable, elle n'a pas voulu me guérir... mon argent est GÂCHE !"},
  {rating: 2, review: "Beaucoup trop cher pour la qualité"},
  {rating: 3, review: "Un brin capricieuse mais expérience innatendue, je le referai sans doute."},
  {rating: 4, review: "Livraison en un clin d'oeil, la licorne s'est amusée avec toute la famille, je recommande absolument!"},
  {rating: 5, review: "MEILLEURE EXPERIENCE DE TOUTE MA VIE!"},
  {rating: 1, review: "Nul nul nul !!!!"},
  {rating: 2, review: "Je m'attendais à beaucoup mieux... choqué déçu !"},
  {rating: 3, review: "Bonne expérience"},
  {rating: 4, review: "Juste ouffissime de pouvoir faire ça en 2020 !!!!"},
  {rating: 5, review: "Rien à dire, le prix en vaut la chandelle !"},
  {rating: 1, review: "La licorne a mordu mes enfants !!!!"},
  {rating: 3, review: "Sympa"},
  {rating: 4, review: "Expérience à couper le souffle, l'équitation va perdre ses adeptes haha"},
  {rating: 4, review: "Exceptionnel !"},
  {rating: 5, review: "Vous n'avez pas menti, mon rêve se réalise enfin, je reprends goût à la vie !!!"},
  {rating: 1, review: "Elle a chié dans mon salon !!"},
  {rating: 3, review: "Bien."},
  {rating: 4, review: "Je recommande miiiiiiille fois malgré le petit retard !!!"},
  {rating: 4, review: "Un vrai plaisir pour toute la famille"},
  {rating: 5, review: "Les mots m'échappent, je n'aurai jamais cru vivre cela un jour !"},
  {rating: 1, review: "Médiocre."},
  {rating: 3, review: "très appréciable"},
  {rating: 4, review: "RA-VIE !"},
  {rating: 5, review: "Je pleure encore de bonheur !!!!"},
  {rating: 5, review: "Mieux que la bouffe !"}
]


DESCRPTION_MAGIC = [
  {magic_power: "ailé", description: "Ma licorne vole depuis des années, elle s'est perfectionnée avec des vitesses de pointes au-dessus du mur du son ! Si vous êtes ferus de sensations fortes, n'hésitez plus !"},
  {magic_power: "guérisseuse", description: "En cette période de pandémie mondiale, ma licorne vous guéri de tous les maux. Rhume des foins ou bien covid, guérison garantie !"},
  {magic_power: "horticultrice", description: "Vous avez du mal à faire poussez vos légumes malgré votre stage de permaculture ? Faites appel à ma licorne qui vous fera un super potager en un rien de temps et cranez devant vos amis bobo !"},
  {magic_power: "yogi", description: "De nature très calme et pédagogue, ma licorne saura faire de vous un maître du yoga. Vous pourrez impressionner vos amis avec la posture de la licorne étendue."},
  {magic_power: "voyante", description: "Si vous vous souciez de votre avenir, ma licorne est faite pour vous ! En plus tout le monde l'apprécie !"},
  {magic_power: "ailé", description: "Elle peut voler avec 4 personnes sur le dos et possède la lisence pour voler au-dessus des villes. Super panorama depuis là-haut !"},
  {magic_power: "guérisseuse", description: "En soufflant avec ses naseaux elle guéri toute maladie très facilement."},
  {magic_power: "horticultrice", description: "Spécialisée dans les plantes tropicales, elle fera de votre jardin un véritable jardin d'Eden !"},
  {magic_power: "yogi", description: "Plus de douleurs aux articulations grâce aux postures inédites de ma licorne. Cours groupés ou particulier, à votre guise."},
  {magic_power: "voyante", description: "Peut prédire l'avenir sur 10 années consécutives de manière très détaillé"},
  {magic_power: "ailé", description: "Elle adore galoper sur les arcs-en-ciel et virevolter entre les nuages."},
  {magic_power: "guérisseuse", description: "Une licorne très efficace pour vous guérir. Pour les femmes enceintes, elle remplace la péridurale !"},
  {magic_power: "horticultrice", description: "Particulièrement douée pour faire pousser les mauvaises herbes si vous voulez faire chier votre voisin ;)"},
  {magic_power: "voyante", description: "Parle aussi à vos proches disparus"},
  {magic_power: "ailé", description: "Vous emmène au dessus des nuages. Evitez les nimbuconubulus, ça la rend nerveuse."},
  {magic_power: "guérisseuse", description: "Passionnée par son métier elle donne corps et âme pour guérir toute maladie."},
  {magic_power: "horticultrice", description: "Pour des fruits et légumes dix fois plus gros que la normale !"}
]

count = 0
17.times do
  unicorn_names = [Faker::Artist.name, Faker::TvShows::Friends.character, Faker::Movies::LordOfTheRings.character, Faker::DcComics.hero, Faker::DcComics.heroine, Faker::TvShows::GameOfThrones.character]
  unicorn = Unicorn.new(
    name: unicorn_names.sample,
    magic_power: DESCRPTION_MAGIC[count][:magic_power],
    description: DESCRPTION_MAGIC[count][:description],
    location: CITIES[count],
    price: rand(350.0..1050.0).round(2),
    user: User.all.to_a.sample
  )
  unicorn.save
  unicorn.photos.attach(io: URI.open(UNICORN_PICTURES[count][:url]), filename: UNICORN_PICTURES[count][:name])
  unicorn.photos.attach(io: URI.open(UNICORN_PICTURES[count + 1][:url]), filename: UNICORN_PICTURES[count + 1][:name])
  count += 1
end

i = 0
30.times do
  booking_start_date = Faker::Date.between(from: '2020-08-26', to: '2020-09-10')
  unicorn = Unicorn.all.to_a.sample
  booking = Booking.new(
    start_date: booking_start_date,
    end_date: Faker::Date.between(from: booking_start_date, to: '2020-09-15'),
    rating: REVIEW_RATING[i][:rating],
    review: REVIEW_RATING[i][:review],
    unicorn: unicorn,
    user: User.all.to_a.select { |user| user != unicorn.user  }.sample
  )
  booking.save
  i += 1
end



