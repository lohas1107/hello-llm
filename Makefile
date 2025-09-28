# Root Makefile for hello-llm workspace

.PHONY: help e2e e2e-clean e2e-build e2e-verbose clean build test

# Default target
help:
	@echo "hello-llm workspace commands:"
	@echo ""
	@echo "E2E Testing:"
	@echo "  e2e          - Run all e2e tests"
	@echo "  e2e-verbose  - Run e2e tests with verbose output"
	@echo "  e2e-clean    - Clean e2e build artifacts"
	@echo "  e2e-build    - Build e2e project"
	@echo ""
	@echo "General:"
	@echo "  clean        - Clean all build artifacts"
	@echo "  build        - Build all projects"
	@echo "  test         - Run all tests"
	@echo "  help         - Show this help message"

# E2E test targets
e2e:
	@echo "Running e2e tests..."
	cd e2e && $(MAKE) test

e2e-verbose:
	@echo "Running e2e tests with verbose output..."
	cd e2e && $(MAKE) test-verbose

e2e-clean:
	@echo "Cleaning e2e build artifacts..."
	cd e2e && $(MAKE) clean

e2e-build:
	@echo "Building e2e project..."
	cd e2e && $(MAKE) build

# Root-level targets
clean: e2e-clean
	@echo "All clean tasks completed"

build: e2e-build
	@echo "All build tasks completed"

test: e2e
	@echo "All test tasks completed"

# Feature-specific e2e targets
e2e-feature:
	@echo "Usage: make e2e-feature FEATURE=feature_name.feature"
	@if [ -n "$(FEATURE)" ]; then \
		cd e2e && $(MAKE) test-feature FEATURE=$(FEATURE); \
	else \
		echo "Please specify FEATURE parameter"; \
	fi

e2e-tags:
	@echo "Usage: make e2e-tags TAGS=@tag1,@tag2"
	@if [ -n "$(TAGS)" ]; then \
		cd e2e && $(MAKE) test-tags TAGS="$(TAGS)"; \
	else \
		echo "Please specify TAGS parameter"; \
	fi