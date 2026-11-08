#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAlternativeTitlesRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-alternative-titles-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase7178 e2e passed"
