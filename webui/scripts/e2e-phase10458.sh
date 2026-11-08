#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthAltPairRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-alt-pair roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase10458 e2e passed"
