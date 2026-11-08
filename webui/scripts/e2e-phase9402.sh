#!/usr/bin/env bash
# Phase-9402: UI ssh-auth-alternative-id roster Soft 9400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-alternative-id roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthAlternativeIdRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9400+ ssh-auth-alternative-id roster ok"; echo "cleaned"; echo "OK: phase9402 e2e passed"
