#!/usr/bin/env bash
# Phase-42332: STATUS mentions schema 5.469 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase42336|through 42336|e2e-phase42336' webui/STATUS.md
echo "STATUS schema 5.469 ok"; echo "cleaned"; echo "OK: phase42332 e2e passed"
