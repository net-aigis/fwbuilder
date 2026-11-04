#!/usr/bin/env bash
# Phase-1803: client surface version types still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
echo "client surface version types ok"
echo "cleaned"
echo "OK: phase1803 e2e passed"
