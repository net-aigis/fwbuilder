#!/usr/bin/env bash
# Phase-698: CSS data-size-type Expanding/Fixed.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'data-size-type="Expanding"' webui/frontend/src/styles/app.css
grep -Fq 'data-size-type="Fixed"' webui/frontend/src/styles/app.css
echo "css size-type ok"
echo "cleaned"
echo "OK: phase698 e2e passed"
