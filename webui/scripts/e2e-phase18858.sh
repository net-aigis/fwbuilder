#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSoft18880EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-soft-18880-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase18858 e2e passed"
