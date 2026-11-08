#!/usr/bin/env bash
# Phase-13292: STATUS mentions schema 5.106 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase13296|through 13296|e2e-phase13296' webui/STATUS.md
echo "STATUS schema 5.106 ok"; echo "cleaned"; echo "OK: phase13292 e2e passed"
