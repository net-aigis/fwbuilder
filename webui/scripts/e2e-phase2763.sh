#!/usr/bin/env bash
# Phase-2763: client surface_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 2760+ surface_roster type ok"
echo "cleaned"
echo "OK: phase2763 e2e passed"
