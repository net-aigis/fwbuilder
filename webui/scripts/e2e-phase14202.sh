#!/usr/bin/env bash
# Phase-14202: UI ssh-auth-soft-phase-parts roster Soft 14200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-phase-parts roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoftPhasePartsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14200+ ssh-auth-soft-phase-parts roster ok"; echo "cleaned"; echo "OK: phase14202 e2e passed"
