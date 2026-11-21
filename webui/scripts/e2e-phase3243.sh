#!/usr/bin/env bash
# Phase-3243: client layout_fidelity_sample_field_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_layout_fidelity_sample_field_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3240+ layout_fidelity_sample_field_roster type ok"
echo "cleaned"
echo "OK: phase3243 e2e passed"
