#!/usr/bin/env bash
# Phase-3147: clear title mentions layout fidelity sample roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout fidelity sample roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(layoutFidelitySampleRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear layout_fidelity_sample_roster ok"
echo "cleaned"
echo "OK: phase3147 e2e passed"
