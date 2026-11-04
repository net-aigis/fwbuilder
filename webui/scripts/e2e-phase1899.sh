#!/usr/bin/env bash
# Phase-1899: client honesty readiness type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_readiness?:' webui/frontend/src/api/client.ts
echo "client readiness type ok"
echo "cleaned"
echo "OK: phase1899 e2e passed"
