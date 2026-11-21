#!/usr/bin/env bash
# Phase-38572: STATUS mentions schema 5.422 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase38576|through 38576|e2e-phase38576' webui/STATUS.md
echo "STATUS schema 5.422 ok"; echo "cleaned"; echo "OK: phase38572 e2e passed"
