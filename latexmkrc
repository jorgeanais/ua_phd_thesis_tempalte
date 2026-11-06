# Build with:  latexmk        (uses XeLaTeX + BibTeX + makeglossaries, see below)
$pdf_mode    = 5;     # 5 = xelatex -> PDF
$bibtex_use  = 2;     # run bibtex when needed, keep .bbl on 'latexmk -c'
$xelatex     = 'xelatex -interaction=nonstopmode -synctex=1 -file-line-error %O %S';
@default_files = ('main.tex');

# List of acronyms (glossaries-extra). The package option 'automake' already builds it;
# this rule is a second safeguard. It calls makeindex directly, so it also works with
# Overleaf's -jobname=output and separate output directory.
add_cus_dep('acn', 'acr', 0, 'run_makeacr');
sub run_makeacr {
  return system("makeindex -q -s \"$_[0].ist\" -t \"$_[0].alg\" -o \"$_[0].acr\" \"$_[0].acn\"");
}
push @generated_exts, 'acn', 'acr', 'alg', 'glo', 'gls', 'glg', 'ist', 'glsdefs';