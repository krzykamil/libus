# frozen_string_literal: true


RSpec.describe Main::Parsers::Google::Isbn do
  subject(:parser) { described_class.new.parse(json: file) }
  context 'when a simple one book response from google is parsed' do
    let(:file) { File.read('spec/fixtures/volumes.json') }

    it 'succeeds' do
      expect(parser).to eq({
                            title: 'Leviathan Wakes',
                            authors: 'James S.A. Corey',
                            publisher: "Orbit Books",
                            published_date: "2012",
                            category: 'Fiction',
                            language: "en",
                            description: "NOW A PRIME ORIGINAL SERIES 'The science fictional equivalent of A Song of Ice and Fire' NPR Books Leviathan Wakes is the Hugo-nominated first book in the New York Times bestselling Expanse series. Humanity has colonised the solar system - Mars, the Moon, the Asteroid Belt and beyond - but the stars are still out of our reach. Jim Holden is an officer on an ice miner making runs from the rings of Saturn to the mining stations of the Belt. When he and his crew discover a derelict ship called the Scopuli, they suddenly find themselves in possession of a deadly secret. A secret that someone is willing to kill for, and on an unimaginable scale. War is coming to the system, unless Jim can find out who abandoned the ship and why. Detective Miller is looking for a girl. One girl in a system of billions, but her parents have money - and money talks. When the trail leads him to the Scopuli and Holden, they both realise this girl may hold the key to everything. Holden and Miller must thread the needle between the Earth government, the Outer Planet revolutionaries and secret corporations, and the odds are against them. But out in the Belt, the rules are different, and one small ship can change the fate of the universe. The Expanse series has sold over two million copies worldwide and is now a major television series. The Expanse series: Leviathan Wakes Caliban's War Abaddon's Gate Cibola Burn Nemesis Games Babylon's Ashes Persepolis Rising Tiamat's Wrath Praise for the Expanse: 'As close as you'll get to a Hollywood blockbuster in book form' io9.com 'Great characters, excellent dialogue, memorable fights' wired.com 'High adventure equalling the best space opera has to offer, cutting-edge technology and a group of unforgettable characters . . . Perhaps one of the best tales the genre has yet to produce' Library Journal 'This is the future the way it's supposed to be' Wall Street Journal 'Tense and thrilling' SciFiNow",
                            isbn_numbers: [
                              {
                                type: "ISBN_10",
                                identifier: "1841499897"
                              },
                              {
                                type: "ISBN_13",
                                identifier: "9781841499895"
                              }
                            ]
                          }
                        )



    end
  end
end
#hash_including(
#                                 title: 'Leviathan Wakes',
#                                 authors: 'James S.A. Corey',
#                                 publisher: "Orbit Books",
#                                 published_date: "2012",
#                                 category: 'Fiction',
#                                 language: "en",
#                                 description: "NOW A PRIME ORIGINAL SERIES 'The science fictional equivalent of A Song of Ice and Fire' NPR Books Leviathan Wakes is the Hugo-nominated first book in the New York Times bestselling Expanse series. Humanity has colonised the solar system - Mars, the Moon, the Asteroid Belt and beyond - but the stars are still out of our reach. Jim Holden is an officer on an ice miner making runs from the rings of Saturn to the mining stations of the Belt. When he and his crew discover a derelict ship called the Scopuli, they suddenly find themselves in possession of a deadly secret. A secret that someone is willing to kill for, and on an unimaginable scale. War is coming to the system, unless Jim can find out who abandoned the ship and why. Detective Miller is looking for a girl. One girl in a system of billions, but her parents have money - and money talks. When the trail leads him to the Scopuli and Holden, they both realise this girl may hold the key to everything. Holden and Miller must thread the needle between the Earth government, the Outer Planet revolutionaries and secret corporations, and the odds are against them. But out in the Belt, the rules are different, and one small ship can change the fate of the universe. The Expanse series has sold over two million copies worldwide and is now a major television series. The Expanse series: Leviathan Wakes Caliban's War Abaddon's Gate Cibola Burn Nemesis Games Babylon's Ashes Persepolis Rising Tiamat's Wrath Praise for the Expanse: 'As close as you'll get to a Hollywood blockbuster in book form' io9.com 'Great characters, excellent dialogue, memorable fights' wired.com 'High adventure equalling the best space opera has to offer, cutting-edge technology and a group of unforgettable characters . . . Perhaps one of the best tales the genre has yet to produce' Library Journal 'This is the future the way it's supposed to be' Wall Street Journal 'Tense and thrilling' SciFiNow",
#                                 isbn_numbers: array_including(
#                                   hash_including(
#                                     type: "ISBN_10",
#                                     identifier: "1841499897"
#                                   ),
#                                   hash_including(
#                                     type: "ISBN_13",
#                                     identifier: "9781841499895"
#                                   )
#                                 )
#                               )
