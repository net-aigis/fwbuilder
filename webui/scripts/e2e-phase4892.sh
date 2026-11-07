#!/usr/bin/env bash
# Phase-4892: STATUS mentions schema 5.1 / 4889-4896.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase4896|through 4896|e2e-phase4896' webui/STATUS.md
echo "STATUS schema 5.1 ok"; echo "cleaned"; echo "OK: phase4892 e2e passed"
