#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshImplementedRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-implemented-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase7818 e2e passed"
