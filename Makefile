submissions: \
    pollos_petrel/evaro_01_submission.csv

pollos_petrel/evaro_01_submission.csv: pollos_petrel/example_submission.csv
	@echo "Creating evaro_01 submission..."
	cp pollos_petrel/example_submission.csv $@

.PHONY: \
    clean \
    submissions

clean:
	rm --force pollos_petrel/evaro_01_submission.csv

