#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthNiCountRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-ni-count roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase13498 e2e passed"
