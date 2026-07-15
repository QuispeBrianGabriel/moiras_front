DC      := docker compose
SERVICE := frontend

RESET  := \033[0m
BOLD   := \033[1m
RED    := \033[0;31m
GREEN  := \033[0;32m
YELLOW := \033[0;33m
CYAN   := \033[0;36m

.DEFAULT_GOAL := help
.PHONY: up stop clear help

up:
	@printf "$(CYAN)$(BOLD)🚀 Levantando entorno...$(RESET)\n"
	@$(DC) up -d --build
	@printf "$(GREEN)🤖 Preparando el contenedor$(RESET)\n"
	@$(DC) exec $(SERVICE) npm ci
	@printf "$(GREEN)✅ Entrando a la bash del contenedor$(RESET)\n"
	@$(DC) exec $(SERVICE) bash

stop:
	@printf "$(YELLOW)🛑 Deteniendo entorno...$(RESET)\n"
	@$(DC) stop
	@printf "$(GREEN)✅ Entorno detenido$(RESET)\n"

clear:
	@printf "$(RED)$(BOLD)🧹 Limpiando entorno por completo...$(RESET)\n"
	@$(DC) down --rmi local --volumes --remove-orphans
	@printf "$(GREEN)✅ Listo, como recién clonado$(RESET)\n"

help:
	@printf "\n$(BOLD)$(CYAN)🐳 Moiras Front — Entorno de desarrollo$(RESET)\n\n"
	@printf "  $(GREEN)up$(RESET)      🚀 Levanta el contenedor y entra a su bash\n"
	@printf "  $(GREEN)stop$(RESET)    🛑 Detiene el contenedor\n"
	@printf "  $(GREEN)clear$(RESET)   🧹 Elimina contenedores, volúmenes e imagen del proyecto\n"
	@printf "  $(GREEN)help$(RESET)    ❓ Muestra esta ayuda\n"
	@printf "\n"
