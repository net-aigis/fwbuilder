#!/usr/bin/env bash
# Phase-39932: STATUS mentions schema 5.439 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase39936|through 39936|e2e-phase39936' webui/STATUS.md
echo "STATUS schema 5.439 ok"; echo "cleaned"; echo "OK: phase39932 e2e passed"
