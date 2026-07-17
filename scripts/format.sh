#!/usr/bin/env bash
set -e

RESET='\033[0m'
BOLD='\033[1m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'

step() {
  printf "\n${CYAN}${BOLD}▶ %s${RESET}\n" "$1"
}

step "Formateando el proyecto con Prettier"

prettier . --write

printf "\n${GREEN}${BOLD}✅ Formato aplicado correctamente${RESET}\n\n"
