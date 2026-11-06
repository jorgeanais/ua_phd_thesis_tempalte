# PhD thesis template — Universidad de Antofagasta
Programa de Doctorado en Astrofísica y Astroinformática · CITEVA

Written in English with Spanish parts (Resumen, Agradecimientos, title page).
Compiled with **XeLaTeX** (Unicode, system/OpenType fonts) + **BibTeX** (astronomy style `aa.bst`) + **makeglossaries** (list of acronyms).

## Quick start
1. Edit the thesis data in `main.tex` and the front matter in `frontmatter/`.
2. Write each chapter in `chapters/chapterN.tex`, with its figures in `figures/chapterN/`.
3. Add references to `references.bib` and cite them with `\citet`/`\citep`.
4. Define acronyms in `acronyms.tex` and use them with `\gls{MW}`, `\glspl{GC}`, `\glscite{2MASS}{Skrutskie2006}` (see the comments at the top of that file).
5. Compile with `latexmk` (XeLaTeX). `latexmk` and Overleaf run `makeglossaries` automatically.
   Manual build: `xelatex main && bibtex main && makeglossaries main && xelatex main && xelatex main`.

The compiled example (`thesis-example.pdf`) is also the user manual: Chapter 1 explains, with live output, citations, cross-references (`\cref`), figures, tables, units and acronyms (section 1.7); Appendix B explains how to compile. Delete its example sections when you are done (checklist in section 1.8).


## Layout
    main.tex            thesis data (title, author, supervisors) + document structure
    preamble.tex        packages and global style (rarely needs edits)
    macros.tex          your own macros (\hi, \hii, \nii, \Msun, \Mstar, \SFR, ...)
    acronyms.tex        acronym definitions (\newacronym); the List of Acronyms is printed after the List of Tables
    references.bib      bibliography (BibTeX exported from NASA/ADS)
    aa.bst              astronomy author-year bibliography style
    aas_macros.sty      journal macros used by ADS (\apj, \mnras, \aap, ...)
    frontmatter/        titlepage, abstract (EN), resumen (ES), agradecimientos (ES)
    chapters/           chapter1.tex ... chapter5.tex   (one file per chapter)
    appendices/         appendixA.tex ...
    figures/            one folder per chapter: figures/chapter1/, figures/chapter2/, ...


## Acronyms
Acronyms are handled by `glossaries-extra` (setup in `preamble.tex`, definitions in `acronyms.tex`).
- First use prints the long form and the acronym, e.g. *Milky Way (MW)*; later uses print *MW*.
- Only acronyms used in the text appear in the **List of Acronyms** (front matter, after the List of Tables, also in the TOC).
- The first-use state is reset at `\mainmatter`, so acronyms used in the abstract are spelled out again in Chapter 1.
- In captions and headings use `\glsxtrshort{...}` instead of `\gls{...}`.
- Requires the `makeglossaries` script (Perl). On Windows without Perl, use `makeglossaries-lite main` instead.

## Numbers
- Running text uses old-style figures (1959); `siunitx` quantities, tables and **digits in math mode** use lining figures from Caslon, so `$-0.6<\FeH$` matches `\qty{12.5}{\mega\parsec}`.
- `\qtyrange{4}{8}{\giga\year}` prints the unit once: *4–8 Gyr* (`range-units = single` in `preamble.tex`).

## Changes in this version
- List of Acronyms (`glossaries-extra`): new file `acronyms.tex`, commands `\gls`, `\glspl`, `\Gls`, `\glscite`; built automatically by `latexmk`/Overleaf.
- Math digits in Caslon lining figures (letters and symbols stay Latin Modern).
- `siunitx`: unit written once in ranges.
- Appendix entries in the PDF bookmarks no longer lose the space ("Appendix A Title").

