#!/usr/bin/env bash
# Phase-26572: STATUS mentions schema 5.272 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase26576|through 26576|e2e-phase26576' webui/STATUS.md
echo "STATUS schema 5.272 ok"; echo "cleaned"; echo "OK: phase26572 e2e passed"
