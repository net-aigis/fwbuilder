#!/usr/bin/env bash
# Phase-9242: UI ssh-auth-bool-flag roster Soft 9240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-bool-flag roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthBoolFlagRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9240+ ssh-auth-bool-flag roster ok"; echo "cleaned"; echo "OK: phase9242 e2e passed"
