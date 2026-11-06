#!/usr/bin/env bash
# Phase-3851: client surface version + health_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_health_roster?:' webui/frontend/src/api/client.ts
echo "client surface/health_roster types ok"
echo "cleaned"
echo "OK: phase3851 e2e passed"
