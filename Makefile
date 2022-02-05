submissions: \
    pollos_petrel/example_python_submission.csv \
    pollos_petrel/example_r_submission.csv

pollos_petrel/example_python_submission.csv: pollos_petrel/example_submission.csv
	@echo "Creating Python submission..."
	cp pollos_petrel/example_submission.csv $@

pollos_petrel/example_r_submission.csv: pollos_petrel/example_submission.csv
	@echo "Creating R submission..."
	cp pollos_petrel/example_submission.csv $@

module = pollos_petrel

define lint
	pylint \
        --disable=bad-continuation \
        --disable=missing-class-docstring \
        --disable=missing-function-docstring \
        --disable=missing-module-docstring \
        ${1}
endef

.PHONY: \
    check \
    clean \
    coverage \
    format \
    linter \
    mutants \
    setup \
    submissions \
    tests

check:
	R -e "library(styler)" \
      -e "resumen <- style_dir('R')" \
      -e "resumen <- rbind(resumen, style_dir('tests'))" \
      -e "any(resumen[[2]])" \
      | grep FALSE
	black --check --line-length 100 ${module}
	black --check --line-length 100 tests
	flake8 --max-line-length 100 ${module}
	flake8 --max-line-length 100 tests
	mypy ${module}
	mypy tests

clean:
	rm --force --recursive ${module}.egg-info
	rm --force --recursive ${module}/__pycache__
	rm --force --recursive .*_cache
	rm --force --recursive SeleccionAnalista2022.Rcheck
	rm --force --recursive tests/__pycache__
	rm --force --recursive tests/testthat/_snaps
	rm --force .mutmut-cache
	rm --force NAMESPACE
	rm --force SeleccionAnalista2022_*.tar.gz
	rm --force coverage.xml
	rm --force pollos_petrel/example_*_submission.csv

coverage: setup
	Rscript tests/testthat/coverage.R
	pytest --cov=${module} --cov-report=term-missing --verbose

format:
	black --line-length 100 ${module}
	black --line-length 100 tests

linter:
	$(call lint, ${module})
	$(call lint, tests)

mutants: tests
	@echo "🙁🏹 No mutation testing on R 👾🎉👾"
	mutmut run --paths-to-mutate ${module}

setup:
	R -e "devtools::document()" && \
	R CMD build . && \
	R CMD check SeleccionAnalista2022_0.1.0.tar.gz && \
	R CMD INSTALL SeleccionAnalista2022_0.1.0.tar.gz
	pip install .

tests:
	Rscript -e "devtools::test()"
	pytest --verbose
