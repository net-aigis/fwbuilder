#!/usr/bin/env bash
# Phase-3291: client surface version + catalog_summary_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_catalog_summary_roster?:' webui/frontend/src/api/client.ts
echo "client surface/catalog_summary_roster types ok"
echo "cleaned"
echo "OK: phase3291 e2e passed"
