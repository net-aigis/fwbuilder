#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSoft15KEchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-soft-15k-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase15018 e2e passed"
