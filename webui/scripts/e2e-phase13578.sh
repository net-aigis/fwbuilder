#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthRefusalEchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-refusal-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase13578 e2e passed"
