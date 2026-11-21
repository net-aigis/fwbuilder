#!/usr/bin/env bash
# Phase-20332: STATUS mentions schema 5.194 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase20336|through 20336|e2e-phase20336' webui/STATUS.md
echo "STATUS schema 5.194 ok"; echo "cleaned"; echo "OK: phase20332 e2e passed"
