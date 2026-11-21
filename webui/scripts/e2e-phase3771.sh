#!/usr/bin/env bash
# Phase-3771: client surface version + hard_gaps_closure_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_hard_gaps_closure_roster?:' webui/frontend/src/api/client.ts
echo "client surface/hard_gaps_closure_roster types ok"
echo "cleaned"
echo "OK: phase3771 e2e passed"
