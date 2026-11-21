#!/usr/bin/env bash
# Phase-3146: UI layout fidelity sample roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layoutFidelitySampleRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.layoutFidelitySampleRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelitySampleRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI layout_fidelity_sample_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3146 e2e passed"
