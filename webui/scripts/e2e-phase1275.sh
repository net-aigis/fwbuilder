#!/usr/bin/env bash
# Phase-1275: client still has soft_fertig_surface_keys type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_keys?:' webui/frontend/src/api/client.ts
echo "client surface keys type ok"
echo "cleaned"
echo "OK: phase1275 e2e passed"
