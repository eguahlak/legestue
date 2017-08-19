\version "2.18.0"

markingsSeptember = {
	\key c \major
	\time 6/8
	\partial 8 
	s8 | s2.*3 | s2 r8 s | s2. |                           %  5
	s2.*2 | s2 r8 s | s2.*3 |                              % 11
	s2 r8 s | s2.*3 | s2 s8 \bar "|."
	}

musicSeptemberSoprano = \relative c'' {
	g8 | g4 e8 e4 a8 | g8( f) e d4 f8 | e4  c8 f4 a8 | g4. g8 s c | c4 b8 a8( b) c |           %  5
	b4 g8 g4 e8 | a4 g8 a4 a8 | gis4. e8 s a | a4 d8 d4 c8 | b8( c) a g4 g8 | g4 c8 c4 b8 |    % 11
	a4. g8 s c, | f4 a8 a4 a8 | g4 c8 c4 c8 | c4 g8 g( e) f | e4( f8) e4
	}
	
voiceSeptemberSoprano = \new Voice = "soprano" << \markingsSeptember \musicSeptemberSoprano >>

musicSeptemberAlto = \relative c' {
	e8 | e4 c8 cis4 e8 | e8( d) c! b4 d8 | c4 c8 c4 c8 | d4. e8 s e | g4 g8 fis4 fis8 |        %  5
	fis4 d8 e4 e8 | e4 e8 fis8( e) dis | b4. cis8 s e | f!4 e8 f4 e8 | d4 c!8 b4 d8 | e4 e8 c4 c8 | % 11
	c4. c8 s c | f4 e8 d( e) f | e4 g8 g4 a8 | f4 e8 d( c) b | c4. c4 
	}

voiceSeptemberAlto = \new Voice = "alto" << \markingsSeptember \musicSeptemberAlto >>

musicSeptemberMen = \relative c {
	c8 | c4 c8 a4 a8 | d4 d8 g,4 g8 | c4 c8 a4 a8 | c4. b8 s b | b'4 b8 d,4 d8 |               %  5
	g4 g8 c,4 g'8 | fis4 fis8 b,4 b8 | e4. a,8 s a | d4 d8 d4 d8 | g4 g8 g4 g8 | c,4 c8 e4 e8 |% 11
	f4. e8 s e | d4 d8 g4 g8 | c,4 c8 e4 e8 | d4 d8 g4 g8 | c,4( a8) g4

	}

voiceSeptemberMen = \new Voice = "tenor" << \markingsSeptember \musicSeptemberMen >>

lyricsseptember = \lyricmode {
	Sep -- tem -- bers him -- mel er __ så blå, dens sky -- er ly -- ser hvi -- de, og lydt vi hø -- rer
	lær -- ken slå som før ved for -- års -- ti -- de. Den un -- ge rug af mul -- den gror med grøn -- ne ly -- se
	klin -- ger, men stor -- ken længst af lan -- de fór med sol på si -- ne vin -- ger. 
	}
	
septemberScore = \bookpart {
	\header {
		title = "Septembers himmel"
		composer = "Otto Mortensen"
		poet = "Alex Garff"
		}
	\score {
		\new ChoirStaff <<
			\new Staff {
				\clef treble
				\set Staff.instrumentName = "Soprano"
				\set Staff.shortInstrumentName = "S"
				\set Staff.midiInstrument = "electric piano 1"
				\voiceSeptemberSoprano
				}
			\new Lyrics \lyricsto "soprano" \lyricsseptember
			\new Staff {
				\clef treble
				\set Staff.instrumentName = "Alto"
				\set Staff.shortInstrumentName = "A"
				\set Staff.midiInstrument = "electric piano 1"
				\voiceSeptemberAlto
				}
			
			\new Lyrics = "men" \with { \override VerticalAxisGroup.staff-affinity = #DOWN }
			\new Staff {
				\clef bass
	%			\clef "treble_8"
				\set Staff.instrumentName = \markup \column { "Tenor" "Bass" }
				\set Staff.shortInstrumentName = \markup \column { "T" "B" }
				\set Staff.midiInstrument = "electric piano 1"
				\voiceSeptemberMen
				}
			\context Lyrics = "men" \lyricsto "tenor" \lyricsseptember
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
						"Der er en søndagsstille ro"
						"imellem træer og tage"
						"en munter glæde ved at gro,"
						"som var det sommerdage."
						"Og koen rusker i sit græs"
						"med saften om sin mule,"
						"mens bonden kører hjem med læs,"
						"der lyser solskinsgule."
						}
					}
				\vspace #1.5
				\line { \bold "3."
					\column {
						"Hver stubbet mark, vi stirrer på"
						"står brun og gul og gylden,"
						"og røn står rød og slåen blå"
						"og purpursort står hylden."
						"Og georginer spraglet gror"
						"blandt asters i vor have,"
						"så rig er årets sidste flor:"
						"Oktobers offergave."
						}
					}
				}
			\hspace #0.3
			\column {
				\line { \bold "4."
					\column {
						"De røde æbler løsner let"
						"fra træets trætte kviste."
						"Snart lysner kronens bladenet"
						"og hvert et løv må briste."
						"Når aftensolen på sin flugt"
						"bag sorte grene svinder"
						"om årets sidste røde frugt"
						"den tungt og mildt os minder."
						}
					}
				\vspace #1.5
				\line { \bold "5."
					\column {
						"At flyve som et forårsfrø"
						"for sommerblomst at blive"
						"er kun at visne for at dø"
						"kan ingen frugt du give."
						"Hvis modenhedens milde magt"
						"af livet selv du lærte"
						"da slår bag falmet rosendragt"
						"dit røde hybenhjerte."
						}
					}
				}
			\hspace #0.3
			}
		}
	}