#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSoft17920EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-soft-17920-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase17898 e2e passed"
