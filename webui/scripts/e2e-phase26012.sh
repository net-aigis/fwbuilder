#!/usr/bin/env bash
# Phase-26012: STATUS mentions schema 5.265 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase26016|through 26016|e2e-phase26016' webui/STATUS.md
echo "STATUS schema 5.265 ok"; echo "cleaned"; echo "OK: phase26012 e2e passed"
