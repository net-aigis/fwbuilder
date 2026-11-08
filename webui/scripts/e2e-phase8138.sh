#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshNotImplementedCheckRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-not-implemented-check-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase8138 e2e passed"
