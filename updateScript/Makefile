# Makefile

setup:
	@$(MAKE) install-dependencies
	@echo "#!/bin/bash" > ../.git/hooks/pre-push
	@echo "echo 'Running pre-push hook...'" >> ../.git/hooks/pre-push
	@echo "./updateScript/bash_scripts/update_loiu.sh" >> ../.git/hooks/pre-push
	@chmod +x ../.git/hooks/pre-push
	@echo "Created pre-push hook."

install-dependencies:
	@if [ `uname -s` = Darwin ]; then \
	    echo "Detected macOS, installing jq..."; \
	    if ! command -v jq &> /dev/null; then \
	        brew install jq; \
	    fi; \
	elif [ `uname -s` = Linux ]; then \
	    echo "Detected Linux, installing jq..."; \
	    if ! command -v jq &> /dev/null; then \
	        sudo apt-get update && sudo apt-get install -y jq; \
	    fi; \
	else \
	    echo "Unsupported OS. Please install jq manually."; \
	fi