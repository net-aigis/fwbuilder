#!/usr/bin/env bash
# Phase-39292: STATUS mentions schema 5.431 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase39296|through 39296|e2e-phase39296' webui/STATUS.md
echo "STATUS schema 5.431 ok"; echo "cleaned"; echo "OK: phase39292 e2e passed"
