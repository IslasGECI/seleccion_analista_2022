pollos_petrel/example_python_submission.csv: pollos_petrel/example_submission.csv
	@echo "Creating Python submission..."
	cp pollos_petrel/example_submission.csv $@

pollos_petrel/example_r_submission.csv: pollos_petrel/example_submission.csv
	@echo "Creating R submission..."
	cp pollos_petrel/example_submission.csv $@

.PHONY: \
    check \
    clean \
    coverage \
    mutants \
    setup \
    submissions \
    tests

clean:
	rm --force pollos_petrel/example_*_submission.csv

check:
	R -e "library(styler)" \
	  -e "resumen <- style_dir('R')" \
	  -e "resumen <- rbind(resumen, style_dir('tests'))" \
	  -e "any(resumen[[2]])" \
	  | grep FALSE

clean:
	rm --force --recursive SeleccionAnalista2022.Rcheck
	rm --force --recursive tests/testthat/_snaps
	rm --force SeleccionAnalista2022_*.tar.gz
	rm --force NAMESPACE

coverage: setup
	Rscript tests/testthat/coverage.R

mutants: tests
	@echo "🙁🏹 No mutation testing on R 👾🎉👾"

setup:
	R -e "devtools::document()" && \
	R CMD build . && \
	R CMD check SeleccionAnalista2022_0.1.0.tar.gz && \
	R CMD INSTALL SeleccionAnalista2022_0.1.0.tar.gz

submissions: \
    pollos_petrel/example_python_submission.csv \
    pollos_petrel/example_r_submission.csv

tests:
	Rscript -e "devtools::test()"
