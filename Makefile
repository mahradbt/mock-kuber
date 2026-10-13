export PATH := $(HOME)/.local/bin:$(PATH)

setup:
	./scripts/setup.sh

up:
	k3d cluster create demo -p "8080:80@loadbalancer" --wait || true
	kubectl apply -f k8s/
	kubectl rollout status deploy/db deploy/web --timeout=180s
	@echo "Open http://localhost:8080"

down:
	k3d cluster delete demo
