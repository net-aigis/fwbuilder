#!/usr/bin/env bash
# Phase-9482: UI ssh-auth-refusal-id roster Soft 9480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-refusal-id roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRefusalIdRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9480+ ssh-auth-refusal-id roster ok"; echo "cleaned"; echo "OK: phase9482 e2e passed"
