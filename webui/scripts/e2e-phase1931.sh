#!/usr/bin/env bash
# Phase-1931: client surface version types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_readiness?:' webui/frontend/src/api/client.ts
echo "client surface/readiness types ok"
echo "cleaned"
echo "OK: phase1931 e2e passed"
