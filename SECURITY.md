# Security

Do not use a public portfolio repository to publish real landing-zone configuration from a restricted environment.

Never commit:

- tenant/subscription identifiers
- internal management-group structure if sensitive
- real RBAC assignments
- private network ranges from restricted environments
- policy exceptions
- credentials or deployment secrets
- internal security architecture

This repository uses generic values and a deliberately small architecture.
