#!/usr/bin/env bash
# Phase-2252: STATUS mentions schema 1.8 / 2249-2256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 1\.8|Honesty-Surface-Schema 1\.8|surface_version.*1\.8' webui/STATUS.md
grep -qE 'phase2256|through 2256|e2e-phase2256' webui/STATUS.md
echo "STATUS schema 1.8 ok"
echo "cleaned"
echo "OK: phase2252 e2e passed"
