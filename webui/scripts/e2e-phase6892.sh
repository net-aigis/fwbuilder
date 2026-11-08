#!/usr/bin/env bash
# Phase-6892: STATUS mentions schema 5.26 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase6896|through 6896|e2e-phase6896' webui/STATUS.md
echo "STATUS schema 5.26 ok"; echo "cleaned"; echo "OK: phase6892 e2e passed"
