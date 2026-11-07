#!/usr/bin/env bash
# Phase-4252: STATUS mentions schema 4.3 / 4249-4256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 4\.3|Honesty-Surface-Schema 4\.3|surface_version.*4\.3' webui/STATUS.md
grep -qE 'phase4256|through 4256|e2e-phase4256' webui/STATUS.md
echo "STATUS schema 4.3 ok"
echo "cleaned"
echo "OK: phase4252 e2e passed"
