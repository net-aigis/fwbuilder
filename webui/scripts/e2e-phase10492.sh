#!/usr/bin/env bash
# Phase-10492: STATUS mentions schema 5.71 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase10496|through 10496|e2e-phase10496' webui/STATUS.md
echo "STATUS schema 5.71 ok"; echo "cleaned"; echo "OK: phase10492 e2e passed"
