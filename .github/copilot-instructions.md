# DevRel Technical Content Repository - AI Coding Guide

## Repository Purpose
This repository hosts Developer Relations technical content—tutorials, source code examples, and workshop materials—focused on Oracle Autonomous AI Database (23ai, 26ai) with polyglot application frameworks.

## Architecture & Content Organization

### Directory Structure
- **`db-application-development/`** – Tutorial markdown files organized by technology pattern:
  - `adb-with-wallet/` – Database provisioning & wallet setup (foundational)
  - `spring-boot-app/`, `nodedb-development/`, `pythondb-development-oracledb/`, `streamlit-python/`, `reactjs/`, `javadb-development/`, `dotnet-development/` – Language-specific CRUD application tutorials
  - `google-colab/` – Jupyter notebook development pattern
  - `tools-install/`, `introduction/` – Prerequisite content
  - `workshops/` – Bundled multi-lab workshop materials
- **`source-codes/db-applications/`** – Executable code samples (Java, Python, Node.js, React, .NET, Streamlit)
- **`source-codes/spring-boot-source-codes/BankCustomersApp/`** – Full Maven-based Spring Boot application (reference project)
- **`articles.json`, `links.json`, `videos.json`** – Content metadata for web portal aggregation
- **`index.html`** – Landing page portal with Bootstrap styling

### Data Flow Pattern
Tutorials → JSON metadata → HTML portal. Each tutorial in `db-application-development/` typically has a corresponding entry in `articles.json` with `section`, `technologies`, `description`, and linked `index.html` from workshop subdirectories.

## Tutorial Writing Conventions

### Markdown Structure
Use strict heading hierarchy for all `.md` files:
1. Title as `# Topic Title`
2. Sections: `## Introduction`, `## Task N: [Description]`, `## Learn More`, `## Acknowledgements`
3. SQL/code blocks wrapped in `<copy>` tags for cloud labs (see `google-colab.md` lines 27–67)

### Content Patterns
- **Intro section**: 2-3 sentences, estimated time, objectives list, prerequisites
- **Task sections**: Sequential numbered instructions with screenshots (`![description](images/filename.png)`)
- **Placeholder placeholders**: Use `XXX` for incomplete content (e.g., `google-colab.md` line 6)
- **Database connection examples**: Always include TNS/connection string + wallet path in code samples (reference `customers360.py`, `DataSourceSample.java`)

## Development Environment & Key Dependencies

### Java Projects
- **Build tool**: Maven 3.8+ (see `BankCustomersApp/pom.xml`)
- **Key dependencies**: Spring Boot 3.5.7, Jakarta EE, Oracle JDBC (`ojdbc11-production` v21.5.0.0), Spring Data JPA
- **Java version**: JDK 21 (property in pom.xml)
- **Runtime command**: `mvn spring-boot:run` or `mvn clean install`

### Python/Streamlit Projects
- **Main library**: `oracledb` (newer Python driver, replaces cx_Oracle)
- **Connection pattern**: Use TNS name + wallet config, not plain connection strings (see `customers-crud.py` lines 7–10, 16–21)
- **Streamlit apps**: Follow reactive component pattern (see `customers-crud.py` CRUD functions)

### Node.js Projects
- **Package manager**: npm
- **Key dependency**: `oracledb` v6.9.0 (see `server/package.json`)
- **Framework**: Express.js with CORS support

### React/Full-Stack
- **Structure**: `react/my-client-server-app/` with `client/` (React) and `server/` (Node.js backend)
- **Client build**: Standard React with public/index.html and src/App.js

## Cross-Component Communication & Integration

### Database Connectivity Patterns
1. **Wallet-based** (recommended for autonomous databases):
   - Download wallet from OCI console → extract → reference via `TNS_ADMIN` env var or `config_dir` parameter
   - TNS names include service tier suffix: `indeducation_high`, `indeducation_medium`
   
2. **TLS/mTLS wallet-less**:
   - One-way TLS supported (see `adb-with-wallet.md` Task 5)
   - Connection descriptor in code (see `customers360.py` tlsconnstr example)

3. **Schema setup**:
   - Always reference Task 2 in wallet guides for user creation and initial schema
   - Sample tables: `CUSTOMERS360`, `SALES360`, `BANK_CUSTOMERS`, `MYNOTES` (see google-colab.md)

### External Dependencies
- **OCI Services**: Vision AI (articles.json id:1), Generative AI integration via APIs
- **Cloud portals**: OCI Cockpit console for database provisioning, resource management
- **Tools**: SQL Developer (connection testing), cloud wallets, Terraform for IaC (create-adb-terraform/)

## Key Editing Tasks & Common Changes

### Adding a New Tutorial
1. Create `db-application-development/{topic}/{topic}.md` following markdown structure above
2. Create `images/` subfolder within topic directory
3. Add entry to `articles.json` with matching `section`, `technologies` tags
4. For workshops: create `db-application-development/{topic}/workshop/` with `index.html`, `manifest.json`

### Updating Code Examples
- **Connection strings**: Check for hardcoded passwords (should be `<Your-Password>` placeholder)
- **Wallet paths**: Verify relative or absolute paths match tutorial context
- **Database drivers**: Ensure `oracledb` (Python ≥3.8), `ojdbc11-production` (Java 21+), `node-oracledb` (Node.js) versions match recommendations

### Fixing Incomplete Content
- Search for `XXX` placeholders across `.md` files and replace with actual descriptions
- Validate image references exist in corresponding `images/` folders
- Ensure Learn More & Acknowledgements sections are complete

## Validation Checklist for PR Reviews
- [ ] All markdown headings follow hierarchy (# → ## → ### only)
- [ ] Code blocks use `<copy>` tags for SQL/long scripts
- [ ] Image paths are relative (`images/filename.png`)
- [ ] Database credentials are placeholders, not real secrets
- [ ] JSON metadata (articles.json) entries match tutorial titles and technologies
- [ ] Java: pom.xml versions align with Spring Boot 3.5.7 + JDK 21
- [ ] Python: uses `oracledb` driver with wallet config pattern
- [ ] No XXX placeholders remain in published tutorials
