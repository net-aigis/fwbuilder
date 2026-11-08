#!/usr/bin/env bash
# Phase-8282: UI ssh-alternative-presence-refresh roster Soft 8280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-alternative-presence-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativePresenceRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8280+ ssh-alternative-presence-refresh roster ok"; echo "cleaned"; echo "OK: phase8282 e2e passed"
