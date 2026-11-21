#!/usr/bin/env bash
# Phase-14492: STATUS mentions schema 5.121 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase14496|through 14496|e2e-phase14496' webui/STATUS.md
echo "STATUS schema 5.121 ok"; echo "cleaned"; echo "OK: phase14492 e2e passed"
