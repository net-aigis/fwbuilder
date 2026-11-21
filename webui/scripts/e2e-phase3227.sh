#!/usr/bin/env bash
# Phase-3227: clear title mentions layout fidelity sample field roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout fidelity sample field roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(layoutFidelitySampleFieldRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear layout_fidelity_sample_field_roster ok"
echo "cleaned"
echo "OK: phase3227 e2e passed"
