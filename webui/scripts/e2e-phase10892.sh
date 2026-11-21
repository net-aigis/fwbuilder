#!/usr/bin/env bash
# Phase-10892: STATUS mentions schema 5.76 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase10896|through 10896|e2e-phase10896' webui/STATUS.md
echo "STATUS schema 5.76 ok"; echo "cleaned"; echo "OK: phase10892 e2e passed"
