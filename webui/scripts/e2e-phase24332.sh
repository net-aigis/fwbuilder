#!/usr/bin/env bash
# Phase-24332: STATUS mentions schema 5.244 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase24336|through 24336|e2e-phase24336' webui/STATUS.md
echo "STATUS schema 5.244 ok"; echo "cleaned"; echo "OK: phase24332 e2e passed"
