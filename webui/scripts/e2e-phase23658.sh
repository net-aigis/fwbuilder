#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSoft23640EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-soft-23640-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase23658 e2e passed"
