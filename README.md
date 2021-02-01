![ncr](ncrlatex/tex/ncrlatex/figures/ncrlogo_plustext.png "Netherlands Centre for River Studies" | width=100)

# NCR Abstract & Book of Abstracts style
This repository contains templates and examples for the NCR abstracts and proceedings. See [https://ncr-web.org](ncr-web.org) for more information on NCR. 

## Note for organizers of the NCR Days
If you are the organizer of the NCR Days, good luck! Here are the most important notes:

- Abstract templates are available as LaTeX and Microsoft Word templates. They are generally submitted as PDF. 
- All abstracts are bundled in the Book of Abstracts (Proceedings), together with the colophon, introduction, a programme booklet, information on NCR, a title page and a cover.
    + (LaTeX) templates are available.  
    + Compiling the Book of Abstracts can be done with any specialised software capable of dealing with PDF files and adding page numbers and navigation tools. A LaTeX template is provided in this repository. 
    + The cover should be made by the organiser.

## Note for developers

- If you want to contribute to this repository, feel free to report an issue or shoot in a pull request. 
- If you want to use this code for your own purposes, feel free to. See the license for the fineprint. 


## Installation (Latex)
### MiKTeX

- Open MiKTeX settings (On Windows 7, All Programs->MiKTeX 2.#-> Maintenance->Settings) and navigate to 'Roots' tab
- Click to 'Add...' a new path. Select the 'ncrlatex' directory containing the 'bibtex, dox, tex' subdirectories
- Click Apply
- You should now be able to use the 'ncr_abstract' and 'ncr_bundle' classes

## Class documentation

For the documentation of the ncr abstract and bundle classes, see the [ncrlatex/doc/ncrlatex.pdf](package documentation)
