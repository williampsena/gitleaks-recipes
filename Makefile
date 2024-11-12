# Define the shell for the make process
SHELL := /bin/bash

REPO_PATH := $(PWD)
GITLEAKS_IMAGE := zricethezav/gitleaks:latest
GITLEAKS_CONFIG := $(REPO_PATH)/.gitleaks.toml
GITLEAKS_REPORT := $(REPO_PATH)/gitleaks-report.json

pre-commit: leaks

leaks-history:
	docker run --rm \
    -v $(REPO_PATH):/repo \
    $(GITLEAKS_IMAGE) \
    detect --source /repo \
    --config /repo/.gitleaks.toml \
    --report-format json \
    --report-path /repo/gitleaks-report.json \
    -v

leaks:
	docker run --rm \
    -v $(REPO_PATH):/repo \
    $(GITLEAKS_IMAGE) \
    dir /repo \
    --config /repo/.gitleaks.toml \
    -v

leaks-report:
	docker run --rm \
    -v $(REPO_PATH):/repo \
    $(GITLEAKS_IMAGE) \
    dir /repo \
    --config /repo/.gitleaks.toml \
    --report-format json \
    --report-path /repo/gitleaks-report.json \
    -v

help:
	@echo "Makefile Commands:"
	@echo "  pre-commit        Run gitleaks-history check before commit"
	@echo "  leaks-history    Run gitleaks history detection on the repository"
	@echo "  leaks            Run gitleaks detection on the repository directory"
	@echo "  leaks-report     Run gitleaks with a report on the repository directory"
	@echo "  help             Show this help message"

%:
	@echo "Unknown target '$@'. Use 'make help' to see available commands."
	@$(MAKE) help
