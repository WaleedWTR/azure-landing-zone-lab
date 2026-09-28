# Azure Landing Zone Lab

![Landing zone validation](https://github.com/WaleedWTR/azure-landing-zone-lab/actions/workflows/validate.yml/badge.svg)

A portfolio Azure governance project demonstrating the foundations of a scalable landing-zone pattern with subscription-level Bicep, resource-group separation, policy-as-code and operating-model documentation.

> **Portfolio note:** This is a small educational landing-zone implementation, not a claim that a few templates replace Microsoft's full enterprise-scale architecture.

## What this project demonstrates

- subscription-scope Infrastructure as Code
- platform/workload resource separation
- policy-as-code
- mandatory tagging
- governance guardrails
- deployment validation
- operating-model design
- enterprise architecture thinking

## Architecture

```text
Azure Tenant
    |
Management Groups
    |
Subscription
    |
    +--> Platform Resource Group
    |       +--> shared operational services
    |
    +--> Workload Resource Group
            +--> application resources

Subscription guardrails
    +--> required environment tag
    +--> naming / ownership standards
    +--> security and monitoring expectations
```

## Build

```bash
az bicep lint --file infrastructure/main.bicep
az bicep build --file infrastructure/main.bicep
```

## Key documentation

- [Landing-zone guardrails](governance/guardrails.md)
- [Tagging standard](governance/tagging-standard.md)
- [Cloud operating model](docs/operating-model.md)
- [Implementation roadmap](docs/implementation-roadmap.md)
- [Technical references](docs/references.md)

## Skills demonstrated

**Azure · Landing Zones · Governance · Bicep · Azure Policy · Cloud Architecture · Operating Models · FinOps**
