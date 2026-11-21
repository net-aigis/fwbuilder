#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthAlternativeIdRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-alternative-id roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase9338 e2e passed"
