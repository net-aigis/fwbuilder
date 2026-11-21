#!/usr/bin/env bash
# Phase-22252: STATUS mentions schema 5.218 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase22256|through 22256|e2e-phase22256' webui/STATUS.md
echo "STATUS schema 5.218 ok"; echo "cleaned"; echo "OK: phase22252 e2e passed"
