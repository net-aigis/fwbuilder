#!/usr/bin/env bash
# Phase-3163: client layout_fidelity_sample_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_layout_fidelity_sample_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3160+ layout_fidelity_sample_roster type ok"
echo "cleaned"
echo "OK: phase3163 e2e passed"
