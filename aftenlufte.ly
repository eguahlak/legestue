\version "2.18.0"

markingsAftenlufte = {
	\key c \minor
	\time 4/4
	s1*4 |                     %  4
	s1*4 |                     %  8
	s1*4 |                     % 12
	s1*5 \bar "|."           
	}

musicAftenlufteSoprano = \relative c' {
	\time 4/4 ees4. ees8 ees4 g | bes4. c8 bes4 aes | g4 bes bes bes | bes8( aes) g4 f2 |      %  4
	ees4. ees8 ees4 g | bes4. c8 bes4 a | bes4 d d c | bes8( c) a4 bes2 |                      %  8
	c4 c c c | c8( bes) aes4 g2 | c4 c bes aes | g8( f) ees4 f2 |                              % 12
	ees4. ees8 ees4 g | bes4 ees d c | bes4. c8 g[ f] g[ aes] | bes2.( aes8 f) | ees1
	}

voiceAftenlufteSoprano = \new Voice = "soprano" << \markingsAftenlufte \musicAftenlufteSoprano >>

musicAftenlufteAlto = \relative c' {
	ees4. d8 c4 bes | ees4. ees8 d4 f | ees4 ees aes g | f4 ees d2 |                           %  4
	ees4. ees8 d4 c | d4. c8 d4 fis | g4 bes g g | f!4 ees d2 |                                %  8
	aes'4 f e bes' | aes8( g) f4 e2 | f4 aes f4. d8 | ees4 ees d2 |                            % 12
	ees4. d8 c4 bes | ees4 ees ees aes | ees4. ees8 ees[ d] ees[ f] | g8( f ees4~ ees8 c d4) | ees1
	}
	
voiceAftenlufteAlto = \new Voice = "alto" << \markingsAftenlufte \musicAftenlufteAlto >>

musicAftenlufteMen = \relative c {
	ees4. ees8 ees4 ees | g4. aes8 bes4 bes, | ees4 g f ees | d4 ees bes2 |                    %  4
	ees4. ees8 ees4 ees | g4. ees8 d4 d | g4 g ees ees | f4 f bes,2 |                          %  8
	f'4 aes g e | f4 f c2 | aes'4 f d bes | ees!4 g bes2 |                                     % 12
	ees,4. ees8 ees4 ees | g4 g g aes | g8[ g] f[ ees] ees4 ees | ees4( g8 f ees4 bes) | ees1
	}
	
voiceAftenlufteMen = \new Voice = "tenor" << \markingsAftenlufte \musicAftenlufteMen >>

lyricsAftenlufteLadies = \lyricmode {
	Un -- der -- li -- ge af -- ten -- luf -- te! Hvor -- hen vin -- ker I min hu?
	Mil -- de, lu -- ne blom -- ster -- duf -- te! Sig hvor -- hen I bøl -- ger nu.
	Går I o -- ver hvi -- den strand til mit elsk -- te fø -- de -- land?
	Vil I der med e -- ders bøl -- ger tol -- ke hvad mit hjer -- te døl -- ger?
	}

aftenlufteScore = \bookpart {
	\header {
		title = "Underlige aftenlufte"
		composer = "Carl Nielsen"
		poet = "Adam Oehlensläger"
		}
	\score {
		\new ChoirStaff <<
			\new Staff {
				\clef treble
				\set Staff.instrumentName = "Soprano"
				\set Staff.shortInstrumentName = "S"
				\set Staff.midiInstrument = "electric piano 1"
				\voiceAftenlufteSoprano
				}
			\new Lyrics \lyricsto "soprano" \lyricsAftenlufteLadies
			\new Staff {
				\clef treble
				\set Staff.instrumentName = "Alto"
				\set Staff.shortInstrumentName = "A"
				\set Staff.midiInstrument = "electric piano 1"
				\voiceAftenlufteAlto
				}
			
			\new Lyrics = "men" \with { \override VerticalAxisGroup.staff-affinity = #DOWN }
			\new Staff {
				\clef bass
	%			\clef "treble_8"
				\set Staff.instrumentName = \markup \column { "Tenor" "Bass" }
				\set Staff.shortInstrumentName = \markup \column { "T" "B" }
				\set Staff.midiInstrument = "electric piano 1"
				\voiceAftenlufteMen
				}
			\context Lyrics = "men" \lyricsto "tenor" \lyricsAftenlufteLadies
			>>
		\layout {}
		\midi {}
		}
	\markup {
		\fill-line {
			\line { \bold "2."
				\column {
					"Matte sol! bag bjergets stene"
					"luerød du daler ned;"
					"og nu sidder jeg alene"
					"i min dunkle ensomhed."
					"Hjemme var der intet fjeld;"
					"ak! Så er jeg ude vel,"
					"skal i nat ej barnligt blunde"
					"i min Herthas grønne lunde."
					}
				}
			\line { \bold "3."
				\column {
					"Stille! Stille! Hisset gynger"
					"båden mellem siv og krat:"
					"sødt en mø ved cithren synger"
					"i den tavse lune nat."
					"Hvilke toner! Milde lyst,"
					"hvor du strømmer i mit bryst!"
					"Men hvad savner jeg, og græder,"
					"mens hun dog så venligt kvæder?"
					}
				}
			\line { \bold "4."
				\column {
					"Tager ej min sang for andet"
					"end et ufrivilligt suk!"
					"Længselsfuldt heniler vandet,"
					"aftnen er så blid og smuk."
					"Mangen sådan aftenstund"
					"sad jeg i min kære lund;"
					"mindet vender nu tilbage,"
					"det var årsag til min klage."
					}
				}
			}
		}
	}