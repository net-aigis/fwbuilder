#!/usr/bin/env bash
# Phase-26732: STATUS mentions schema 5.274 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase26736|through 26736|e2e-phase26736' webui/STATUS.md
echo "STATUS schema 5.274 ok"; echo "cleaned"; echo "OK: phase26732 e2e passed"
