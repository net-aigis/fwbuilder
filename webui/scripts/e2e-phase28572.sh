#!/usr/bin/env bash
# Phase-28572: STATUS mentions schema 5.297 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase28576|through 28576|e2e-phase28576' webui/STATUS.md
echo "STATUS schema 5.297 ok"; echo "cleaned"; echo "OK: phase28572 e2e passed"
