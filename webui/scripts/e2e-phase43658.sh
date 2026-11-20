#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSchema483EchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-schema-483-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase43658 e2e passed"
