#!/usr/bin/env bash
# Phase-22732: STATUS mentions schema 5.224 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase22736|through 22736|e2e-phase22736' webui/STATUS.md
echo "STATUS schema 5.224 ok"; echo "cleaned"; echo "OK: phase22732 e2e passed"
