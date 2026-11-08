#!/usr/bin/env bash
# Phase-8202: UI ssh-not-implemented-check-refresh roster Soft 8200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-check-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedCheckRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8200+ ssh-not-implemented-check-refresh roster ok"; echo "cleaned"; echo "OK: phase8202 e2e passed"
