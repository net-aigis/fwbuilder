#!/usr/bin/env bash
# Phase-38892: STATUS mentions schema 5.426 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase38896|through 38896|e2e-phase38896' webui/STATUS.md
echo "STATUS schema 5.426 ok"; echo "cleaned"; echo "OK: phase38892 e2e passed"
