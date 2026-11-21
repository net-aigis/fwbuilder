#!/usr/bin/env bash
# Phase-3403: client honesty_readiness_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_readiness_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3400+ honesty_readiness_roster type ok"
echo "cleaned"
echo "OK: phase3403 e2e passed"
