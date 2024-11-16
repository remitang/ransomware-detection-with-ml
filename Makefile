.PHONY: detector malware prep soutenance

detector:
	@echo "Running detector..."
	@cd detector && sudo python3 detector.py

malware:
	@echo "Running malware..."
	@chmod +x ./malware/malware_soutenance
	@./malware/malware_soutenance

prep:
	@echo "Running dataprep..."
	@mv detector/*.csv logs/training || true
	@cd machinelearning && python3 dataprep.py

soutenance: detector malware prep
	@echo "Running detector..."
	@cd director && python3 detector/detector.py
	@sleep 5
	@echo "Running malware..."
	@./malware_soutenance
	@sleep 3
	@echo "Running dataprep..."
	@cd director && python3 machinelearning/dataprep.py
