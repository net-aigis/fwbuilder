#!/usr/bin/env bash
# Phase-3339: client soft_fertig_honesty_readiness_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_readiness_roster?:' webui/frontend/src/api/client.ts
echo "client honesty readiness roster type ok"
echo "cleaned"
echo "OK: phase3339 e2e passed"
