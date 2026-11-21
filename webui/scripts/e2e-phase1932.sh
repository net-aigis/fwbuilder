#!/usr/bin/env bash
# Phase-1932: STATUS mentions schema 1.3 / 1929-1936.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '1\.3|schema 1\.3|Schema 1\.3|surface_version=1\.3' webui/STATUS.md
grep -qE 'phase1936|through 1936|e2e-phase1936' webui/STATUS.md
echo "STATUS schema 1.3 ok"
echo "cleaned"
echo "OK: phase1932 e2e passed"
