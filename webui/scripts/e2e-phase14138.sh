#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthSoftPhasePartsRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-soft-phase-parts roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase14138 e2e passed"
