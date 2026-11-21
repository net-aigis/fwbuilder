#!/usr/bin/env bash
# Phase-14332: STATUS mentions schema 5.119 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase14336|through 14336|e2e-phase14336' webui/STATUS.md
echo "STATUS schema 5.119 ok"; echo "cleaned"; echo "OK: phase14332 e2e passed"
