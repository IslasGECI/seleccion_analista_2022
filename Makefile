submissions: \
    pollos_petrel/example_python_submission.csv \
    pollos_petrel/example_r_submission.csv

pollos_petrel/example_python_submission.csv: pollos_petrel/example_submission.csv
	@echo "Creating Python submission..."
	cp pollos_petrel/example_submission.csv $@

pollos_petrel/example_r_submission.csv: pollos_petrel/example_submission.csv
	@echo "Creating R submission..."
	cp pollos_petrel/example_submission.csv $@

.PHONY: \
    clean \
    submissions

clean:
	rm --force pollos_petrel/example_*_submission.csv

