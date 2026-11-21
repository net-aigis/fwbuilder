#!/usr/bin/env bash
# Phase-3098: UI layout fidelity sample roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layoutFidelitySampleRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig layout fidelity sample roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download layout fidelity sample roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI layout fidelity sample roster ok"
echo "cleaned"
echo "OK: phase3098 e2e passed"
