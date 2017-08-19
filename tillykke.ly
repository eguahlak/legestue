\version "2.18.0"

\header {
    title = "Der er én, som fylder år i dag"
    composer = "Hans Askou"
    poet = ""
    }

musicTillykke = \relative c'{
    \clef treble
    \key g \major 
    \time 4/4
    \partial 4
    b8 c      | % 1
    d4 d g b,      | % 2
    c e8 d4 r d8      | % 3
    g fis g a b4 c8 b      | % 4
    a4 e fis g8 a      | % 5
    b a g fis g fis e d      | % 6
    e d c b d c b a      | % 7
    g2 g'      | % 8
    g4. fis4 r8 b, c      | % 9
    d4 d g b,      | % 10
    c e8 d4 r d8      | % 11
    g fis g a b4 c8 b      | % 12
    a4 e fis g8 a      | % 13
    b a g fis g fis e d      | % 14
    e d c b d c b a      | % 15
    g2 g'  | % 16
    g4. fis4 \bar "|." 
	}

lyricsTillykke = \lyricmode { \set stanza = " 1. " Der er én, som fyl -- der  år i dag. Og der -- for  skal hun fej -- res  med lys og flag, og en lil -- le  sang, som pas -- ser  her og nu, og der' kun ét ord, der skal brug's: TIL -- LYK -- KE  Ja, til -- lyk -- ke  nu med fød -- sels -- dag'n.  At fej -- re  net -- op  dig, der er ba -- re  sag'n. Og nu øn -- sker  vi, du læn -- ge  le -- ve  må, og di -- ne  øn -- sker  op -- fyldt  få TIL -- LYK -- KE  }

\score {
	\new ChoirStaff <<
		\new Staff {
			\set Staff.midiInstrument = "electric piano 1"
			\new Voice = "soprano" \musicTillykke
			}
		\new Lyrics \lyricsto "soprano" \lyricsTillykke
		>>
	\layout {}
	\midi {} 
 	}


