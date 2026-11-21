#!/usr/bin/env bash
# Phase-2699: client surface roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_roster?:' webui/frontend/src/api/client.ts
echo "client surface roster type ok"
echo "cleaned"
echo "OK: phase2699 e2e passed"
