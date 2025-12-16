# DevRel Technical Content Repository - AI Coding Guide

## Repository Overview
A Developer Relations repository for Oracle Autonomous AI Database (23ai, 26ai) tutorials, source code samples, and workshop materials across polyglot frameworks.

## Architecture Essentials

### Content Organization
- **`db-application-development/`** – Language-specific tutorials (Spring Boot, Python, Node.js, React, .NET, Streamlit) + foundational setup (`adb-with-wallet/`, `tools-install/`)
- **`source-codes/db-applications/`** – Runnable code samples per language (reference implementations)
- **`source-codes/spring-boot-source-codes/BankCustomersApp/`** – Full Maven Spring Boot reference project (Java 21, Spring Boot 3.5.7)
- **Content aggregation** – `articles.json` + `links.json` → indexed in `index.html` portal

### Data Flow
Tutorials link to source code via GitHub URLs. Workshops extend tutorials with `workshop/index.html` + `manifest.json`. All reference Oracle AI Database connectivity patterns.

## Critical Patterns & Workflows

### Database Connectivity (All Languages)
**Wallet-based (recommended):**
```
TNS_ADMIN env var or config_dir parameter → wallet files → TNS name (e.g., `indeducation_high`)
```
See implementations: [customers360.py](source-codes/db-applications/Python-codes/customers360.py#L7-L21) (wallet + TLS), [customers-crud.py](source-codes/db-applications/Streamlit/customers-crud.py#L8-L25) (Streamlit pattern), [DataSourceSample.java](source-codes/db-applications/Java-codes/DataSourceSample.java) (Spring Boot JDBC)

**Connection credentials**: All use `<Your-Password>` placeholders; never commit real secrets.

### Java Projects (Spring Boot)
- **Build**: `mvn clean install` or `mvn spring-boot:run` (pom.xml defines Java 21, Spring Boot 3.5.7)
- **Dependencies**: `ojdbc11-production` (v21.5.0.0), Spring Data JPA, Jakarta EE
- **Schema**: Tasks create `BANK_CUSTOMERS` table via SQL Worksheets (see [spring-boot-app.md Task 1](db-application-development/spring-boot-app/spring-boot-app.md#L24-L40))
- **Reference**: [BankCustomersApp/pom.xml](source-codes/spring-boot-source-codes/BankCustomersApp/pom.xml)

### Python Projects (oracledb Driver)
- **Driver**: `oracledb` (modern replacement for cx_Oracle)
- **Pattern**: Wallet config with `config_dir` + `wallet_location` + `wallet_password` (see [customers-crud.py](source-codes/db-applications/Streamlit/customers-crud.py#L14-L25))
- **Streamlit apps**: Define connection function, then reactive CRUD functions (insert, view, update, delete)
- **No hardcoded TNS** – Always externalize in env vars or config

### Node.js & React
- **Driver**: `oracledb` v6.6.0+ (see [package.json](source-codes/db-applications/NodeJS-codes/package.json))
- **Architecture**: Express backend + React client (see `react/my-client-server-app/`)
- **CORS**: Configure for client-server communication

## Markdown Tutorial Conventions

### Structure (Strict Hierarchy)
```
# Title
## Introduction (2-3 sentences, estimated time, objectives, prerequisites)
## Task 1: [Action]
## Task 2: [Action]
...
## Learn More
## Acknowledgements
```

### Content Requirements
- SQL/long code blocks use `<copy>` tags (cloud lab requirement)
- Images: relative paths only (`images/filename.png`) in same directory
- Database connection examples: must include TNS/connection string + wallet path
- Placeholders: use `<Your-Password>` for credentials, `XXX` for incomplete sections (must be resolved before publishing)
- Sample tables: `CUSTOMERS360`, `SALES360`, `BANK_CUSTOMERS`, `MYNOTES`

### Metadata Mapping
Each tutorial `db-application-development/{topic}/{topic}.md` should have corresponding `articles.json` entry with `section`, `technologies` tags, and optional `workshop/index.html` + `manifest.json` for complex labs.

## Common Editing Tasks

### Add a Tutorial
1. Create `db-application-development/{topic}/{topic}.md` (follow structure above)
2. Create `images/` subfolder; add screenshots
3. Add entry to `articles.json` (`section`, `technologies`, `url`)
4. For multi-task tutorials: add `workshop/index.html` + `manifest.json`

### Update Code Examples
- Verify `oracledb` (Python), `ojdbc11-production` v21.5.0.0 (Java), `oracledb` v6.6.0+ (Node.js) versions
- Check wallet paths—must be externalized (env vars, config files)
- Ensure credentials are `<Your-Password>` placeholders
- Run locally against dev database to confirm execution

### Validate Before Publishing
- [ ] Images in `images/` folder; paths relative (`![desc](images/file.png)`)
- [ ] Code: wallets + connection strings properly externalized
- [ ] `articles.json` entries match tutorial title & technologies
- [ ] Java: Spring Boot 3.5.7 + JDK 21 in pom.xml
- [ ] Python: `oracledb` driver; wallet config pattern in samples
- [ ] Markdown: strict heading hierarchy (# → ## → ### only)
