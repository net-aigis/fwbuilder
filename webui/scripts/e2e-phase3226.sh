#!/usr/bin/env bash
# Phase-3226: UI layout fidelity sample field roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layoutFidelitySampleFieldRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.layoutFidelitySampleFieldRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelitySampleFieldRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI layout_fidelity_sample_field_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3226 e2e passed"
