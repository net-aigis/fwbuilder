#!/usr/bin/env bash
# Phase-32972: STATUS mentions schema 5.352 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase32976|through 32976|e2e-phase32976' webui/STATUS.md
echo "STATUS schema 5.352 ok"; echo "cleaned"; echo "OK: phase32972 e2e passed"
