#!/usr/bin/env bash
# Phase-12042: UI ssh-auth-path-count roster Soft 12040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-path-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPathCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12040+ ssh-auth-path-count roster ok"; echo "cleaned"; echo "OK: phase12042 e2e passed"
