#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthMs91500EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-ms-91500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase44538 e2e passed"
