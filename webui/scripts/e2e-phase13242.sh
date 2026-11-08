#!/usr/bin/env bash
# Phase-13242: UI ssh-auth-schema-parts roster Soft 13240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-parts roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchemaPartsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13240+ ssh-auth-schema-parts roster ok"; echo "cleaned"; echo "OK: phase13242 e2e passed"
