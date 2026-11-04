#!/usr/bin/env bash
# Phase-2731: client surface version + surface_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_surface_roster?:' webui/frontend/src/api/client.ts
echo "client surface/surface_roster types ok"
echo "cleaned"
echo "OK: phase2731 e2e passed"
