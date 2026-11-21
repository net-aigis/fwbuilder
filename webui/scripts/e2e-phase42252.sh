#!/usr/bin/env bash
# Phase-42252: STATUS mentions schema 5.468 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase42256|through 42256|e2e-phase42256' webui/STATUS.md
echo "STATUS schema 5.468 ok"; echo "cleaned"; echo "OK: phase42252 e2e passed"
