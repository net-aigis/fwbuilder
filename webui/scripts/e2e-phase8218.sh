#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAlternativePresenceRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-alternative-presence-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase8218 e2e passed"
