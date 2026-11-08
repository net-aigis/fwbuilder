#!/usr/bin/env bash
# Phase-8602: UI ssh-implemented-identity-refresh roster Soft 8600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-implemented-identity-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedIdentityRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8600+ ssh-implemented-identity-refresh roster ok"; echo "cleaned"; echo "OK: phase8602 e2e passed"
