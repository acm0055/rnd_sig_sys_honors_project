all: rm_log

compile:
	pdflatex *.tex

.PHONY: rm_log
rm_log: compile
	rm *.log && rm *.aux || true
