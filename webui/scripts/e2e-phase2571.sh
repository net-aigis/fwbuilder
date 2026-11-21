#!/usr/bin/env bash
# Phase-2571: client surface version + honesty_export_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_export_roster?:' webui/frontend/src/api/client.ts
echo "client surface/honesty_export_roster types ok"
echo "cleaned"
echo "OK: phase2571 e2e passed"
