# Makefile for Cucumber E2E Tests

.PHONY: test clean build help test-verbose test-feature test-tags

# Default target
help:
	@echo "E2E Cucumber Test Commands:"
	@echo ""
	@echo "Basic Commands:"
	@echo "  test         - Run all Cucumber tests"
	@echo "  test-verbose - Run tests with verbose output"
	@echo "  clean        - Clean build artifacts"
	@echo "  build        - Build the project"
	@echo "  help         - Show this help message"
	@echo ""
	@echo "Advanced Commands:"
	@echo "  test-feature FEATURE=name.feature - Run specific feature file"
	@echo "  test-tags TAGS=@tag1,@tag2       - Run tests with specific tags"

# Run Cucumber tests
test:
	./gradlew test

# Clean build artifacts
clean:
	./gradlew clean

# Build the project
build:
	./gradlew build

# Run tests with verbose output
test-verbose:
	./gradlew test --info

# Run specific feature file
test-feature:
	@echo "Usage: make test-feature FEATURE=path/to/feature.feature"
	@if [ -n "$(FEATURE)" ]; then \
		./gradlew test -Dcucumber.features=src/test/resources/features/$(FEATURE); \
	else \
		echo "Please specify FEATURE parameter"; \
		echo "Example: make test-feature FEATURE=example.feature"; \
	fi

# Run tests with specific tags
test-tags:
	@echo "Usage: make test-tags TAGS=@tag1,@tag2"
	@if [ -n "$(TAGS)" ]; then \
		./gradlew test -Dcucumber.filter.tags="$(TAGS)"; \
	else \
		echo "Please specify TAGS parameter"; \
		echo "Example: make test-tags TAGS=@smoke,@regression"; \
	fi

# Run tests and generate reports
test-report:
	./gradlew test
	@echo "Test reports available at: build/reports/tests/test/index.html"
	@echo "Cucumber reports available at: target/cucumber-reports.html"