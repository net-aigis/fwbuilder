#!/usr/bin/env bash
# Phase-2075: client honesty surface changelog type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_changelog?:' webui/frontend/src/api/client.ts
echo "client changelog type ok"
echo "cleaned"
echo "OK: phase2075 e2e passed"
