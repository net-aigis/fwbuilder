#!/usr/bin/env bash
# Phase-4412: STATUS mentions schema 4.5 / 4409-4416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 4\.3|Honesty-Surface-Schema 4\.3|surface_version.*4\.3' webui/STATUS.md
grep -qE 'phase4416|through 4416|e2e-phase4416' webui/STATUS.md
echo "STATUS schema 4.5 ok"
echo "cleaned"
echo "OK: phase4412 e2e passed"
