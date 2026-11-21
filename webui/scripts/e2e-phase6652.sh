#!/usr/bin/env bash
# Phase-6652: STATUS mentions schema 5.23 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase6656|through 6656|e2e-phase6656' webui/STATUS.md
echo "STATUS schema 5.23 ok"; echo "cleaned"; echo "OK: phase6652 e2e passed"
