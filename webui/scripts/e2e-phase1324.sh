#!/usr/bin/env bash
# Phase-1324: STATUS mentions closure related refusals / 1321-1328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'related refusals.*(closure|summary)|closure.*related refusals' webui/STATUS.md
grep -qE 'phase1328|through 1328|e2e-phase1328' webui/STATUS.md
echo "STATUS closure related refusals ok"
echo "cleaned"
echo "OK: phase1324 e2e passed"
