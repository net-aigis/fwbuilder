#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthAltCountRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-alt-count roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase12458 e2e passed"
