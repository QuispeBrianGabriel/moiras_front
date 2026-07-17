#!/usr/bin/env bash
set -e

RESET='\033[0m'
BOLD='\033[1m'

GREEN='\033[0;32m'
CYAN='\033[0;36m'

step() {
  printf "\n${CYAN}${BOLD}▶ %s${RESET}\n" "$1"
}

success() {
  printf "${GREEN}  ✓ %s${RESET}\n" "$1"
}

step "Lint (eslint)"
eslint . --max-warnings 0
success "Sin errores"

step "Formato (prettier)"
prettier . --check
success "Formato correcto"

step "Tipos (tsc)"
tsc --noEmit
success "Sin errores de tipos"

step "Tests unitarios + cobertura (vitest)"
vitest run --coverage
success "Tests unitarios completados"

step "Tests E2E (cucumber)"
cucumber-js
success "Tests E2E completados"

step "Build (vite)"
vite build
success "Build completado"

printf "\n${GREEN}${BOLD}✅ Todo OK${RESET}\n\n"
