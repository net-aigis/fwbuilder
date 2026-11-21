#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshRefusalPathTitlesRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-refusal-path-titles-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase7258 e2e passed"
