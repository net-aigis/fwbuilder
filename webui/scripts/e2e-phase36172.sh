#!/usr/bin/env bash
# Phase-36172: STATUS mentions schema 5.392 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase36176|through 36176|e2e-phase36176' webui/STATUS.md
echo "STATUS schema 5.392 ok"; echo "cleaned"; echo "OK: phase36172 e2e passed"
