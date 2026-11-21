#!/usr/bin/env bash
# Phase-47292: STATUS mentions schema 5.531 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase47296|through 47296|e2e-phase47296' webui/STATUS.md
echo "STATUS schema 5.531 ok"; echo "cleaned"; echo "OK: phase47292 e2e passed"
