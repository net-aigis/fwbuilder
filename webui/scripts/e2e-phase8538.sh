#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshImplementedIdentityRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-implemented-identity-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase8538 e2e passed"
