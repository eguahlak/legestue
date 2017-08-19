\version "2.18.0"

markingsSensommer = {
	\key g \minor
	\time 4/4
	s1*14 \bar "|."
	}
	
musicSemsommerCommon = \relative c' {
	d4 d g8[ a] bes[ g] | a4 g8 a d,4 d | g4 f8 g d2 | d4 d g8[ a] bes[ g] |               %  4
	a4 g8 a d,4 d | g4 f8 g d2 |                                                           %  6 
	}
	
musicSensommerSoprano = \relative c'' {
	g4 d' d c8 bes | c4 d8 c bes4 f | g4. g8 c[ bes] a[ g] |                               %  9
	a4 bes8 a g2 | g4 d' d c8 bes | c4 d8 c bes4 f | g4 g ees' ees | d8[ ees] d[ c] bes2   % 14
	}
	
voiceSensommerSoprano = \new Voice = "soprano" << \markingsSensommer { \musicSemsommerCommon \musicSensommerSoprano } >>

musicSensommerAlto = \relative c'' {
	g4 f ees ees8 ees | ees4 f8 ees d4 d | g4. f8 ees[ d] ees[ ees]                        %  9
	c4 d8 d g2 | g4 f ees ees8 ees | ees4 f8 ees d4 d | g4 g fis fis | f!8[ g] f[ ees] d2  % 14
	}

voiceSensommerAlto = \new Voice = "alto" << \markingsSensommer { \musicSemsommerCommon \musicSensommerAlto } >>

musicSensommerMen = \relative c' {
	\transpose g g, \musicSemsommerCommon
	g2 c,4 c | f2 bes, | g'2 c, |                                                          %  9
	d4 d8 d g2 | g2 c,4 c | f2 bes, | g'2 ees | f8[ f] f[ f] bes,2                         % 14
 	}

voiceSensommerMen = \new Voice = "tenor" << \markingsSensommer \musicSensommerMen  >>

lyricsSensommerLadies = \lyricmode {
	Æb -- ler ly -- ser rødt på træ -- er -- nes gre -- ne, høs -- ten går ind. Går i gen -- nem sko -- ven
	gan -- ske a -- le -- ne, stil -- le i sind. Gyld -- ne far -- ver og sen -- som -- mer -- bri -- se fyl -- der hjer -- tet med ve --
	mo -- dig mu -- sik, går og nyn -- ner en sen -- som -- mer -- vi -- se fjernt fra by -- ens lar -- men -- de tra -- fik.
	}
	
lyricsSensommerMen = \lyricmode {
	Æb -- ler ly -- ser rødt på træ -- er -- nes gre -- ne, høs -- ten går ind. Går i gen -- nem sko -- ven
	gan -- ske a -- le -- ne, stil -- le i sind. Sen -- som -- mer -- bri -- se med ve --
	mo -- dig mu -- sik, sen -- som -- mer -- vi -- se fjernt fra lar -- men -- de tra -- fik.
	}

sensommerScore = \bookpart {
	\header {
		title = "Sensommervise"
		composer = "Kirsten og Finn Jørgensen"
		poet = "Kirsten og Finn Jørgensen"
		}
	\score {
		\new ChoirStaff <<
			\new Staff {
				\clef treble
				\set Staff.instrumentName = "Soprano"
				\set Staff.shortInstrumentName = "S"
				\set Staff.midiInstrument = "electric piano 1"
				\transpose g e \voiceSensommerSoprano
				}
			\new Lyrics \lyricsto "soprano" \lyricsSensommerLadies
			\new Staff {
				\clef treble
				\set Staff.instrumentName = "Alto"
				\set Staff.shortInstrumentName = "A"
				\set Staff.midiInstrument = "electric piano 1"
				\transpose g e \voiceSensommerAlto
				}
			\new Lyrics = "men" \with { \override VerticalAxisGroup.staff-affinity = #DOWN }
			\new Staff {
				\clef bass
				% \clef "treble_8"
				\set Staff.instrumentName = \markup \column { "Tenor" "Bass" }
				\set Staff.shortInstrumentName = \markup \column { "T" "B" }
				\set Staff.midiInstrument = "electric piano 1"
				\transpose g e \voiceSensommerMen
				}
			\context Lyrics = "men" \lyricsto "tenor" \lyricsSensommerMen
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
						"Sommerbrisen danner krusning på søen,"
						"mystisk og sort."
						"Stæreflokke svæver højt over øen -"
						"snart tager de bort."
						}
					}
				\vspace #1.5
				\line { \bold "3."
					\column {
						"Duft af brænderøg blandt brunlige bregner,"
						"blåsorte bær."
						"Stille summen mellem blade som blegner -"
						"aft'nen er nær..."
						}
					}
				\vspace #1.5
				\line { \bold "4."
					\column {
						"Modne rønnebær bag dybgrønne grene"
						"rødt titter frem -"
						"Går igennem skoven ganske alene -"
						"nu må jeg hjem!"
						}
					}
				}
			\hspace #0.3
			\column {
				\vspace #4.0
				\line { \bold \italic "omkvæd"
					\column {
						\italic "Gyldne farver og sensommerbrise"
						\italic "Fylder hjertet med vemodig musik,"
						\italic "går og nynner en sensommervise"
						\italic "fjernt fra byens larmende trafik."
						}
					}
				}
			\hspace #0.3
			}
		}
	}