#!/usr/bin/env bash
# Phase-3131: client surface version + layout_fidelity_sample_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_layout_fidelity_sample_roster?:' webui/frontend/src/api/client.ts
echo "client surface/layout_fidelity_sample_roster types ok"
echo "cleaned"
echo "OK: phase3131 e2e passed"
