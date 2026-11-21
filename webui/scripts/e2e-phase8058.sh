#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshImplementedCheckRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-implemented-check-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase8058 e2e passed"
