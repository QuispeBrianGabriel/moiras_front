# 🌌 Moiras Frontend

> 💡Frontend de la plataforma **Moiras**, un sistema diseñado para ayudar a los educadores a gestionar el desarrollo de sus estudiantes mediante evidencia verificable, permitiendo a estos últimos visibilizar su crecimiento educativo y profesional.

## 🎯 ¿Qué es Moiras?

Moiras es un proyecto que busca convertirse en la infraestructura digital para todo tipo de educadores. Ofreciendo un conjunto de herramientas necesarias para gestionar este proceso y transformar esas interacciones en evidencia verificable que refleje el desarrollo profesional de cada individuo.

Nuestro objetivo es superar la limitación de la autodeclaración; en su lugar, construimos una trayectoria sólida respaldada directamente por las personas e instituciones que han formado parte del proceso de aprendizaje

---

## 💻 Este repositorio

Este repositorio contiene la aplicación frontend desarrollada con React y Vite.

- 🎨 UI diseñada para una experiencia fluida, intuitiva y accesible
- 🔌 Comunicación directa con los servicios de backend a través de API

---

## 🏗️ Arquitectura de despliegue

El proyecto adopta un modelo de despliegue basado en **versiones inmutables**.

Cada release genera una imagen Docker identificada por su versión (`vX.Y.Z`), la cual se publica en GitHub Container Registry (GHCR). Las imágenes nunca se modifican una vez publicadas.

El pipeline de despliegue actualiza automáticamente la configuración del servicio en Railway mediante su API GraphQL para que apunte explícitamente a la versión liberada y, posteriormente, dispara un nuevo despliegue.

**Ventajas:**

- 📦 Imágenes Docker inmutables
- 🔖 Versionado explícito
- 🔄 Rollbacks determinísticos
- 📜 Trazabilidad completa
- 🚀 Despliegues reproducibles

**Desventaja:** modificar la configuración del servicio, requiere del token de mi cuenta personal.

---

## Tecnologías

- **Core**: React ⚛️ + TypeScript 📘 + Vite ⚡
- **Linter**: ESLint 🔍
- **Formatter**: Prettier ✨
- **Virtualización**: Docker 🐳 + Docker Compose 🐙
- **Servidor**: Nginx 🟢
- **Testing**: Vitest 🧪 + Testing Library 🐙 + Cucumber 🥒
- **Automatización**: GitHub Actions 🚀
- **Contenedores**: GitHub Container Registry (GHCR) 📦
- **Infraestructura**: Railway 🚂

---

## 💎 Calidad del proyecto

- 🔄 Integración Continua (CI) completamente automatizada
- 🚀 Despliegue Continuo (CD) mediante GitHub Actions y Railway GraphQL API
- 📦 Versionado inmutable de artefactos Docker
- 🔁 Rollbacks reproducibles hacia cualquier versión publicada
- 🐳 Contenedores Docker garantizando paridad entre desarrollo y producción
- 🧪 Testing con pruebas unitarias y de comportamiento
- 🛡️ Análisis estático de código
- 📜 Trazabilidad completa del ciclo de liberación
- ☁️ Infraestructura serverless apoyada en servicios SaaS

---

## 🚀 Ejecución

Levanta el proyecto localmente en un solo comando:

```bash
make start
```

Para conocer todas las tareas de automatización disponibles:

```bash
make help
```

---

## 📈 Estado del Proyecto

🛠️ **Moiras** se encuentra en _desarrollo activo_.
