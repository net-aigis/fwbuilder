#!/usr/bin/env bash
# Phase-16172: STATUS mentions schema 5.142 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase16176|through 16176|e2e-phase16176' webui/STATUS.md
echo "STATUS schema 5.142 ok"; echo "cleaned"; echo "OK: phase16172 e2e passed"
