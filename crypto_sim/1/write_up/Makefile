all: rm_log

compile:
	pdflatex -shell-escape *.tex

.PHONY: rm_log
rm_log: compile
	rm *.log && rm *.aux || true
