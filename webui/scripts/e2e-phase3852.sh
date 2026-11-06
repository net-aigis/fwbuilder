#!/usr/bin/env bash
# Phase-3852: STATUS mentions schema 3.8 / 3849-3856.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 3\.8|Honesty-Surface-Schema 3\.8|surface_version.*3\.8' webui/STATUS.md
grep -qE 'phase3856|through 3856|e2e-phase3856' webui/STATUS.md
echo "STATUS schema 3.8 ok"
echo "cleaned"
echo "OK: phase3852 e2e passed"
