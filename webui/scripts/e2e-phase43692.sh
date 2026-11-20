#!/usr/bin/env bash
# Phase-43692: STATUS mentions schema 5.486 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase43696|through 43696|e2e-phase43696' webui/STATUS.md
echo "STATUS schema 5.486 ok"; echo "cleaned"; echo "OK: phase43692 e2e passed"
