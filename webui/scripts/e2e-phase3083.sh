#!/usr/bin/env bash
# Phase-3083: client layout_fidelity_signal_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_layout_fidelity_signal_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3080+ layout_fidelity_signal_roster type ok"
echo "cleaned"
echo "OK: phase3083 e2e passed"
