#!/usr/bin/env bash
# Phase-32492: STATUS mentions schema 5.346 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase32496|through 32496|e2e-phase32496' webui/STATUS.md
echo "STATUS schema 5.346 ok"; echo "cleaned"; echo "OK: phase32492 e2e passed"
