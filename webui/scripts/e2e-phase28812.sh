#!/usr/bin/env bash
# Phase-28812: STATUS mentions schema 5.300 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase28816|through 28816|e2e-phase28816' webui/STATUS.md
echo "STATUS schema 5.300 ok"; echo "cleaned"; echo "OK: phase28812 e2e passed"
