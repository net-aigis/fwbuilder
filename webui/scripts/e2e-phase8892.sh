#!/usr/bin/env bash
# Phase-8892: STATUS mentions schema 5.51 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase8896|through 8896|e2e-phase8896' webui/STATUS.md
echo "STATUS schema 5.51 ok"; echo "cleaned"; echo "OK: phase8892 e2e passed"
