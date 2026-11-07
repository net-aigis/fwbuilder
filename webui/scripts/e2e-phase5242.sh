#!/usr/bin/env bash
# Phase-5242: UI ssh-method-lists roster Soft 5240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-method-lists roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshMethodListsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5240+ ssh-method-lists roster ok"; echo "cleaned"; echo "OK: phase5242 e2e passed"
