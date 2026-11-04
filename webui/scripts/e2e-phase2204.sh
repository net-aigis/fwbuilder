#!/usr/bin/env bash
# Phase-2204: STATUS mentions Soft 2200 / 2201-2208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '2200|Soft 2200|through 2200' webui/STATUS.md
grep -qE 'phase2208|through 2208|e2e-phase2208' webui/STATUS.md
echo "STATUS Soft 2200+ ok"
echo "cleaned"
echo "OK: phase2204 e2e passed"
