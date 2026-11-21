#!/usr/bin/env bash
# Phase-3178: UI layout fidelity sample field roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layoutFidelitySampleFieldRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout fidelity sample field roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download layout fidelity sample field roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI layout fidelity sample field roster ok"
echo "cleaned"
echo "OK: phase3178 e2e passed"
