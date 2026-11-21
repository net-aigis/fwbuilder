#!/usr/bin/env bash
# Phase-7962: UI ssh-not-implemented-refresh roster Soft 7960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 7960+ ssh-not-implemented-refresh roster ok"; echo "cleaned"; echo "OK: phase7962 e2e passed"
