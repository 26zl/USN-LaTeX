# USN-LaTeX

LaTeX-maler for **bacheloroppgave** og **mastergradsavhandling** ved [Universitetet i Sørøst-Norge (USN)](http://www.usn.no), tilpasset USNs offisielle Word-maler.

Designgrunnlag: [USNs maler for oppgaveskriving](https://min.usn.no/startside-student/tjenester-for-studenter/oppgaveskriving/maler-for-oppgaveskriving/).

## Standardoppsett

- **Sideformat:** A4 med 2,5 cm marger
- **Brødtekst:** Times New Roman 12 pt
- **Linjeavstand:** 1,5
- **Overskrifter og forside:** Carlito (sans-serif, USNs visuelle identitet)
- **Språk:** norsk (bokmål)
- **Kildehåndtering:** BibLaTeX med APA-stil
- **Klikkbar innholdsfortegnelse**

## Bruk

Hver mal ligger som en **selvstendig undermappe** under `Theses/`. Du trenger kun å kopiere én undermappe — den inneholder alt som trengs.

### Overleaf

1. Gå til [overleaf.com](https://www.overleaf.com) → New Project → Upload Project.
2. Last opp som zip enten `Theses/BSc/`-mappen eller `Theses/Master/`-mappen.
3. I Overleaf: Menu → Compiler → **XeLaTeX**.
4. Kompiler.

### Eget repo / lokalt

Kopier én av undermappene (`Theses/BSc/` eller `Theses/Master/`) til ditt eget prosjekt. Bygg med:

```sh
make            # bygger PDF
make clean      # fjerner mellomfiler
make distclean  # fjerner alt inkludert PDF-en
```

Krever [XeLaTeX](https://en.wikipedia.org/wiki/XeTeX) eller [LuaLaTeX](https://en.wikipedia.org/wiki/LuaTeX) (følger med MacTeX, TeX Live og MiKTeX). Times New Roman må være installert som systemfont.

### Bygg begge fra dette repoet

```sh
cd Theses
make            # bygger begge: BSc/BScThesis.pdf og Master/MasterThesis.pdf
make BSc        # bygger kun bachelor
make Master     # bygger kun master
```

## Filstruktur

```text
Theses/
├── Makefile                        # Bygger begge maler
├── BSc/                            # Selvstendig — kan kopieres alene
│   ├── BScThesis.tex               # Hovedfil — rediger denne
│   ├── USN-BSc.cls                 # Klassedefinisjon
│   ├── thesis.bib                  # BibLaTeX-kilder
│   ├── Makefile
│   └── fig/
│       ├── cover-shapes.png
│       └── USN_logo_main_nb_sort.pdf
└── Master/                         # Selvstendig — kan kopieres alene
    ├── MasterThesis.tex            # Hovedfil — rediger denne
    ├── USN-MSc.cls                 # Klassedefinisjon
    ├── thesis.bib
    ├── Makefile
    └── fig/
        ├── cover-shapes.png
        └── USN_logo_main_nb_sort.pdf
```

## Forsidemetadata

Sett øverst i `.tex`-filen:

```latex
\faculty{Fakultet for teknologi, naturvitenskap og maritime fag}
\subjectinfo{TS3000 — Eksempelkode}
\semester{Vår 2026}
\candidate{Kandidatnummer 42}
\title{Min oppgavetittel}
\subtitle{En undertittel}
```

For master, fyll i tillegg ut publisher-info-siden:

```latex
\USNpublisherinfo{Institutt for [...]}{2026}{Forfatternavn}{60}
```

## Funksjoner

| Bruk | Kommando |
|---|---|
| Klikkbar overskrift i TOC (unummerert) | `\USNsection{Sammendrag}` |
| Vedlegg (Vedlegg A, B, …) | `\USNappendix` foran `\section{...}` |
| Bilder/figurer | `\includegraphics{...}` (legg filer i `fig/`) |
| Tabeller | `\toprule`, `\midrule`, `\bottomrule` (booktabs) |
| Lister | `\begin{itemize}[leftmargin=*]` (enumitem) |
| Kode | `\begin{lstlisting}[language=Python, caption=…]` |
| Matematikk | `\begin{equation} … \end{equation}` |
| SI-enheter | `\SI{9.81}{\meter\per\second\squared}` |
| Sitater | `\parencite{nøkkel}` med BibLaTeX |
| Lenker | `\url{...}` eller `\href{url}{tekst}` |

## Lisens

Basert på den opprinnelige [USN-LaTeX-malen av Dietmar Winkler](https://github.com/dietmarw/USN-LaTeX), med modifikasjoner av Laurent Zogaj. Distribuert under [LaTeX Project Public License](LICENSE) (LPPL) versjon 1.3 eller nyere.
