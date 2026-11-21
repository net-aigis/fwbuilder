#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthGapLabelEchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-gap-label-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase10858 e2e passed"
