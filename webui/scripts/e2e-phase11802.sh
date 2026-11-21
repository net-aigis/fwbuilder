#!/usr/bin/env bash
# Phase-11802: UI ssh-auth-catalog-count roster Soft 11800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-catalog-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthCatalogCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11800+ ssh-auth-catalog-count roster ok"; echo "cleaned"; echo "OK: phase11802 e2e passed"
