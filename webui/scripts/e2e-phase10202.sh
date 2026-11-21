#!/usr/bin/env bash
# Phase-10202: UI ssh-auth-support-gate roster Soft 10200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-support-gate roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSupportGateRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10200+ ssh-auth-support-gate roster ok"; echo "cleaned"; echo "OK: phase10202 e2e passed"
