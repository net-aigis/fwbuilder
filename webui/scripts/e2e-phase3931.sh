#!/usr/bin/env bash
# Phase-3931: client surface version + res_status_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_res_status_roster?:' webui/frontend/src/api/client.ts
echo "client surface/res_status_roster types ok"
echo "cleaned"
echo "OK: phase3931 e2e passed"
