\version "2.18.0"

markingsAgres = {
	\tempo 4 = 60
	\key f \major
	\time 2/4
	\partial 8
	s8 | s2*4 |                   % 4
	s2*3 | s4. \bar "|."
	}
	
musicAgresSoprano = \relative c'' {
	a8 | c8. a16 c8 a | bes8 d c a | f8 f c' bes | a4 g8 g |           %  4
	a8. a16 bes8 c | d8 e f d | c8 a c bes16( a) | g4 f8               %  8
	}

voiceAgresSoprano = \new Voice = "soprano" << \markingsAgres \musicAgresSoprano >>

musicAgresAlto = \relative c' {
	f8 | f8. f16 a8 f | f8 f a f | f8 d c g' | f4 e8 g |               %  4
	f8. f16 g8 a | bes8 bes a bes | a8 f g f | f8( e) c8               %  8
	}

voiceAgresAlto = \new Voice = "alto" << \markingsAgres \musicAgresAlto >>

musicAgresTenor = \relative c {
	f8 | a8. f16 f8 f | d8 bes f' e | d8 bes a bes | c4 c8 g' |        %  4
	f8. f16 f8 f | bes8 g d e | f8 f e d | bes8( c) a                  %  8
	}
	
voiceAgresTenor = \new Voice = "tenor" << \markingsAgres \musicAgresTenor >>

musicAgresBass = \relative c {
	f8 | a8. f16 f8 f | d8 bes f' e | d8 bes a bes | c4 c8 g' |        %  4
	f8. f16 f8 f | bes8 g d e | f8 f e d | bes8( c) f,                 %  8
	}
	
voiceAgresBass = \new Voice = "bass" << \markingsAgres \musicAgresBass >>

lyricsAgres = \lyricmode {
	Det lys -- ner o -- ver ag -- res felt
	hvor slø -- ve plov -- spand krav -- le,
  	det sort -- ner o -- ver Sto -- re -- bælt
  	med sol på kir -- ke -- gav -- le.
	}
	
agresScore = \bookpart {
	\header {
		title = "Det lysner over agres felt"
		composer = "Harald Balslev"
		poet = "Ludvig Holstein"
		}
	\score {
		\new ChoirStaff <<
			\new Staff {
				\clef treble
				\set Staff.instrumentName = "Soprano"
				\set Staff.shortInstrumentName = "S"
				\set Staff.midiInstrument = "electric piano 1"
				\voiceAgresSoprano
				}
			\new Lyrics \lyricsto "soprano" \lyricsAgres
			\new Staff {
				\clef treble
				\set Staff.instrumentName = "Alto"
				\set Staff.shortInstrumentName = "A"
				\set Staff.midiInstrument = "electric piano 1"
				\voiceAgresAlto
				}
			\new Staff {
				\clef "treble_8"
				\set Staff.instrumentName = "Tenor"
				\set Staff.shortInstrumentName = "T"
				\set Staff.midiInstrument = "electric piano 1"
				\voiceAgresTenor
				}
			\new Lyrics \lyricsto "tenor" \lyricsAgres
			\new Staff {
				\clef bass
				\set Staff.instrumentName = "Bass"
				\set Staff.shortInstrumentName = "B"
				\set Staff.midiInstrument = "electric piano 1"
				\voiceAgresBass
				}
			>>
		\layout {}
		\midi {}
		}
	\markup {
		\fill-line {
			\hspace #0.3
			\column {
				\line { \bold "2."
					\column {
						"Velkommen i vor grønsværsstol"
						"blandt grøftens brombærranker!"
						"O, det gør godt at slikke sol"
						"igen på disse banker!"
						}
					}
				\vspace #1.5
				\line { \bold "3."
					\column {
						"Vel rækker høstens solskin kort,"
						"men rønnens bær står røde."
						"Alleens linde blegner bort,"
						"men vildvinsranker gløde."
						}
					}
				\vspace #1.5
				\line { \bold "4."
					\column {
						"Vel! Ræk mig da, o efterår,"
						"en gravensten, som smager"
						"af bækken ved min faders gård"
						"og mulden i hans ager."
						}
					}
				}
			\hspace #0.1
			\column {
				\line { \bold "5."
					\column {
						"Og bag mig, sol, og blød mig, regn!"
						"Jeg plukker mine nødder"
						"og trasker langs et brombærhegn"
						"med plovmuld under fødder."
						}
					}
				\vspace #1.5
				\line { \bold "6."
					\column {
						"Og det er al den jord, jeg har,"
						"og alt hvad jeg begærer."
						"Jeg håber, det går an, jeg ta'r,"
						"hvad mine såler bærer."
						}
					}
				}
			\hspace #0.3
			}
		}
	}
 	