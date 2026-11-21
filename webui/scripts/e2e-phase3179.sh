#!/usr/bin/env bash
# Phase-3179: client soft_fertig_layout_fidelity_sample_field_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_layout_fidelity_sample_field_roster?:' webui/frontend/src/api/client.ts
echo "client layout fidelity sample field roster type ok"
echo "cleaned"
echo "OK: phase3179 e2e passed"
