# CareOps Compliance Platform

An Azure platform that helps a small healthcare provider **build, enforce and prove** its
technical safeguards. It is built entirely with Terraform, deployed by GitHub Actions, and uses
**synthetic data only**.

## The problem

Small clinics and health-tech teams often run IT by hand: access is granted ad hoc, nobody can say
where data lives, logging is patchy, and when someone asks "can you prove it?" there is nothing to
show. Healthcare adds legal duties around access control, data residency and audit trails (POPIA in
South Africa, HIPAA for US employers).

The CareOps Compliance Platform does three things:

1. **Build** a secure, repeatable environment from code.
2. **Enforce** rules automatically (policy guardrails, blocking security scans, reviewed changes).
3. **Prove** it by producing evidence reports from the live environment.

It is *aligned to* those requirements. It is not certified, and no real patient data is used.

## Status

Week 1: foundation. Remote state, passwordless OIDC login, and a pipeline that validates, scans,
plans on pull requests and applies from `main`. One resource group deploys.

## Planned

- **Governance:** Azure Policy for allowed regions, required tags and no public storage
- **Identity:** Entra ID groups for clinical, admin and auditor roles, mapped to RBAC
- **Network and monitoring:** VNet and NSGs, Log Analytics, alerts and a budget in Terraform
- **App layer:** a small serverless API with synthetic FHIR-style records
- **Compliance evidence:** Python scripts that check live Azure against POPIA-aligned controls and
  write a report, plus a drift audit and an access review
- **Documentation:** a POPIA control map and runbooks

## How it is built

- `bootstrap/` is run once from a laptop. It creates the state storage and the GitHub OIDC identity.
- `environments/dev/` is the deployment the pipeline manages.
- `modules/` will hold reusable building blocks.
- `.github/workflows/terraform.yml` runs format, validate, TFLint, Checkov and Trivy on every push,
  a plan on pull requests, and apply only from `main`.

## Decisions

- **Region:** `southafricanorth` (Johannesburg), so data stays in South Africa to support POPIA data
  residency. Azure Static Web Apps is not available in that region, so any front end will be hosted as a
  storage static website or left out. Storage, Key Vault, Log Analytics, Cosmos DB and Functions were
  checked as available for this subscription.
- **Naming:** live Azure resources use the short prefix `careops`, so the platform's display name can
  change without renaming (and rebuilding) anything.
- **Scanner exceptions:** accepted findings are suppressed inline (`#checkov:skip=ID:reason`) or in
  `.trivyignore`, each with a written reason.

## Lessons carried over from the Azure Secure Client Environment Baseline project

OIDC subjects use numeric IDs, every module declares provider versions, deployment environments are
restricted to `main`, accepted scanner findings are documented as they appear, and live resource
names are never changed by a find-and-replace.
