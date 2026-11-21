#!/usr/bin/env bash
# Phase-4123: client soft_fertig_layout_fidelity_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_layout_fidelity_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4120+ soft_fertig_layout_fidelity_roster type ok"
echo "cleaned"
echo "OK: phase4123 e2e passed"
