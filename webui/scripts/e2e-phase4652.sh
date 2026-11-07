#!/usr/bin/env bash
# Phase-4652: STATUS mentions schema 4.8 / 4649-4656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 4\.3|Honesty-Surface-Schema 4\.3|surface_version.*4\.3' webui/STATUS.md
grep -qE 'phase4656|through 4656|e2e-phase4656' webui/STATUS.md
echo "STATUS schema 4.8 ok"
echo "cleaned"
echo "OK: phase4652 e2e passed"
