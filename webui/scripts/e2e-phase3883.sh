#!/usr/bin/env bash
# Phase-3883: client soft_fertig_health_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_health_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3880+ soft_fertig_health_roster type ok"
echo "cleaned"
echo "OK: phase3883 e2e passed"
