# Bidra

Rettelser og forbedringer av malene er velkomne: feil i klassefilene, avvik
fra USNs offisielle maler, pakker som har sluttet å virke i ny TeX Live, og
bedre forklaringer i README. Malene skal fortsatt være selvstendige mapper
som kan lastes rett opp i Overleaf, så hold deg til pakker som følger med
TeX Live, MacTeX og MiKTeX.

## Oppsett

Du trenger XeLaTeX (eller LuaLaTeX), `latexmk` og `biber`, som alle følger
med TeX Live, MacTeX og MiKTeX, og skriften Times New Roman installert på
maskinen. Overskriftsfonten Carlito følger med TeX Live. De binære filene
(`fig/*.pdf`, `fig/*.png` og de ferdige PDF-ene) ligger i Git LFS, så
installer `git-lfs` før du kloner:

```sh
git lfs install
git clone https://github.com/26zl/USN-LaTeX.git
cd USN-LaTeX
```

## Test at malene kompilerer

Hver mal bygges med `latexmk -xelatex` fra sin egen mappe, eller begge fra
`Theses/`:

```sh
cd Theses
make            # bygger BSc/BScThesis.pdf og Master/MasterThesis.pdf
make BSc        # bare bachelor
make Master     # bare master
make clean      # fjerner mellomfiler, beholder PDF-ene
```

Et bidrag er klart når begge malene kompilerer uten feil og uten nye
advarsler i loggen (`BScThesis.log` og `MasterThesis.log`), og PDF-ene ser
riktige ut: forside, innholdsfortegnelse, overskrifter, figurer, tabeller
og litteraturliste. Kjør `make gogo` (`latexmk -gg`) etter endringer i en
`.cls`-fil, så latexmk bygger alt på nytt.

Endrer du en `.cls`- eller `.tex`-fil, bygg PDF-en på nytt og ta den med i
samme commit, slik at `BScThesis.pdf` og `MasterThesis.pdf` i repoet alltid
viser gjeldende mal.

### Overleaf

Repoet har ingen CI, så Overleaf er den andre testen: last opp mappen
(`Theses/BSc/` eller `Theses/Master/`) som zip, sett Menu → Compiler til
**XeLaTeX** og kompiler. Pakker og skrifter som finnes lokalt, men ikke i
Overleafs TeX Live, viser seg her.

## Stil

- Norsk (bokmål) i malene og i README; kommandoene i klassefilene beholder
  `USN`-prefikset (`\USNcover`, `\USNsection`, `\USNappendix`).
- To mellomrom som innrykk i `.tex`, `.cls` og `.bib`, tabulator i
  `Makefile` (se `.editorconfig`).
- Endre BSc- og Master-malen likt når begge er berørt; klassefilene er med
  vilje nesten like.

## Pull requests

Lag en gren fra `main`, gjør én endring per pull request, og skriv hva du
endret og hvorfor, hvilken TeX-distribusjon du kompilerte med, og om du
testet i Overleaf. Commit-meldinger er korte setninger i imperativ på
engelsk, slik historikken allerede er (`Add common thesis packages and
per-section figure numbering`).

Sikkerhetsproblemer meldes som beskrevet i [SECURITY.md](SECURITY.md).
