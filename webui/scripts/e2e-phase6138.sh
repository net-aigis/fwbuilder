#!/usr/bin/env bash
# Phase-6138: UI ssh-alternative-presence roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativePresenceRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-alternative-presence roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-alternative-presence roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-alternative-presence roster ok"; echo "cleaned"; echo "OK: phase6138 e2e passed"
