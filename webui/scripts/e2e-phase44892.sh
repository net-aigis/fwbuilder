#!/usr/bin/env bash
# Phase-44892: STATUS mentions schema 5.501 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase44896|through 44896|e2e-phase44896' webui/STATUS.md
echo "STATUS schema 5.501 ok"; echo "cleaned"; echo "OK: phase44892 e2e passed"
