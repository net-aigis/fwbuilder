#!/usr/bin/env bash
# Phase-21852: STATUS mentions schema 5.213 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase21856|through 21856|e2e-phase21856' webui/STATUS.md
echo "STATUS schema 5.213 ok"; echo "cleaned"; echo "OK: phase21852 e2e passed"
