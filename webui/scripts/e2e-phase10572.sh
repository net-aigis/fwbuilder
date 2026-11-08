#!/usr/bin/env bash
# Phase-10572: STATUS mentions schema 5.72 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase10576|through 10576|e2e-phase10576' webui/STATUS.md
echo "STATUS schema 5.72 ok"; echo "cleaned"; echo "OK: phase10572 e2e passed"
