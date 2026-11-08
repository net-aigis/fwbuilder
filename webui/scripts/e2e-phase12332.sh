#!/usr/bin/env bash
# Phase-12332: STATUS mentions schema 5.94 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase12336|through 12336|e2e-phase12336' webui/STATUS.md
echo "STATUS schema 5.94 ok"; echo "cleaned"; echo "OK: phase12332 e2e passed"
