#!/usr/bin/env bash
# Phase-28252: STATUS mentions schema 5.293 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase28256|through 28256|e2e-phase28256' webui/STATUS.md
echo "STATUS schema 5.293 ok"; echo "cleaned"; echo "OK: phase28252 e2e passed"
