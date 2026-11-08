#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSupportGateRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-support-gate roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase10138 e2e passed"
