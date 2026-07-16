#!/usr/bin/env bash
set -e

RESET='\033[0m'
BOLD='\033[1m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'

step() {
  printf "\n${CYAN}${BOLD}▶ %s${RESET}\n" "$1"
}

step "Lint (eslint)"
eslint . --max-warnings 0

step "Formato (prettier)"
prettier . --check

step "Tipos (tsc)"
tsc --noEmit

step "Tests unitarios + cobertura (vitest)"
vitest run --coverage

step "Tests E2E (cucumber)"
cucumber-js

step "Build (vite)"
vite build

printf "\n${GREEN}${BOLD}✅ Todo OK${RESET}\n\n"
