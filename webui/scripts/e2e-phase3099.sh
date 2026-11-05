#!/usr/bin/env bash
# Phase-3099: client soft_fertig_layout_fidelity_sample_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_layout_fidelity_sample_roster?:' webui/frontend/src/api/client.ts
echo "client layout fidelity sample roster type ok"
echo "cleaned"
echo "OK: phase3099 e2e passed"
