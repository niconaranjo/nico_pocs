# Makefile

setup:
	@echo "#!/bin/bash" > ../.git/hooks/pre-push
	@echo "echo 'Running pre-push hook...'" >> ../.git/hooks/pre-push
	@echo "../../updateScript/bash_scripts/update_loiu.sh" >> ../.git/hooks/pre-push
	@chmod +x ../.git/hooks/pre-push
	@echo "Created pre-push hook."