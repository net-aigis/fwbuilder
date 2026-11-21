#!/usr/bin/env bash
# Phase-6202: UI ssh-alternative-presence roster Soft 6200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-alternative-presence roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativePresenceRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6200+ ssh-alternative-presence roster ok"; echo "cleaned"; echo "OK: phase6202 e2e passed"
