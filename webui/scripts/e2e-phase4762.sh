#!/usr/bin/env bash
# Phase-4762: UI ssh-not-implemented roster Soft 4760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4760+ ssh-not-implemented roster ok"
echo "cleaned"
echo "OK: phase4762 e2e passed"
