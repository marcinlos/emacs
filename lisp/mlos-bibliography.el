;;; Bibliography directory settings

(defconst mlos/bibliography-dir "~/bibliography/"
  "Main bibliography directory")

(defun mlos/in-bib-dir (path)
  "Appends the supplied path to path of the bibliography directory `mlos/bibliography-dir'"
  (expand-file-name path mlos/bibliography-dir))

(defconst mlos/bibliography-file (mlos/in-bib-dir "references.bib")
  "Main bibliography file")

(defconst mlos/bibliography-notes-dir (mlos/in-bib-dir "notes")
  "Directory for notes related to articles")

(defconst mlos/bibliography-pdfs-dir (mlos/in-bib-dir "pdfs")
  "Directory for storing PDF files corresponding to bibliography items")


(provide 'mlos-bibliography)
