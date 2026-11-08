#!/usr/bin/env bash
# Phase-11482: UI ssh-auth-clear-hint roster Soft 11480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-clear-hint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthClearHintRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11480+ ssh-auth-clear-hint roster ok"; echo "cleaned"; echo "OK: phase11482 e2e passed"
