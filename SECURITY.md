# Sikkerhet

Dette er LaTeX-maler. Det eneste som kjører, er det XeLaTeX og BibLaTeX gjør
under kompilering. Et sikkerhetsproblem her vil typisk være en klassefil
(`USN-BSc.cls`, `USN-MSc.cls`) eller en mal som kjører eksterne kommandoer
(shell escape / `\write18`), henter innhold fra nettet eller skriver filer
utenfor prosjektmappen, eller en binærfil i `fig/` som ikke er det den gir
seg ut for.

## Rapportering

Meld fra privat via GitHub:
[Rapporter en sårbarhet](https://github.com/26zl/USN-LaTeX/security/advisories/new)
(fanen «Security» i repoet). Ikke opprett et offentlig issue for noe som kan
utnyttes før det er rettet. Regn med et første svar innen en uke; rettelsen
havner på `main`, og sikkerhetsvarselet publiseres når den er inne.

Vanlige feil i malene (kompileringsfeil, feil på forsiden, pakker som
mangler) meldes som et vanlig
[issue](https://github.com/26zl/USN-LaTeX/issues).

## Støttede versjoner

Det finnes ingen utgivelser; det er `main` som vedlikeholdes. Hent mappen
`Theses/BSc/` eller `Theses/Master/` på nytt for å få med rettelser.
