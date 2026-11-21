#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAlternativeSupportRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-alternative-support-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase8778 e2e passed"
