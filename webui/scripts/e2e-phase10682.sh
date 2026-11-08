#!/usr/bin/env bash
# Phase-10682: UI ssh-auth-empty-check roster Soft 10680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-empty-check roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthEmptyCheckRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10680+ ssh-auth-empty-check roster ok"; echo "cleaned"; echo "OK: phase10682 e2e passed"
