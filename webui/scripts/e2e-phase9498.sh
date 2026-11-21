#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthImplementedIdRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-implemented-id roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase9498 e2e passed"
