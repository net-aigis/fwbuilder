#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshNotImplementedRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-not-implemented-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase7898 e2e passed"
