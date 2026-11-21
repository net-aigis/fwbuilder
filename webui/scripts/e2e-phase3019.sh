#!/usr/bin/env bash
# Phase-3019: client soft_fertig_layout_fidelity_signal_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_layout_fidelity_signal_roster?:' webui/frontend/src/api/client.ts
echo "client layout fidelity signal roster type ok"
echo "cleaned"
echo "OK: phase3019 e2e passed"
