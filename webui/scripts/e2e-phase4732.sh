#!/usr/bin/env bash
# Phase-4732: STATUS mentions schema 4.9 / 4729-4736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 4\.9|Honesty-Surface-Schema 4\.9|surface_version=4\.9|soft_fertig_honesty_surface_version 4\.9' webui/STATUS.md
grep -qE 'phase4736|through 4736|e2e-phase4736' webui/STATUS.md
echo "STATUS schema 4.9 ok"
echo "cleaned"
echo "OK: phase4732 e2e passed"
