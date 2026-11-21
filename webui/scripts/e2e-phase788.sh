#!/usr/bin/env bash
# Phase-788: STATUS mentions min/max size samples / 785-792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_minimum_size|minSize=|minimum_size/maximum_size' webui/STATUS.md
grep -qE 'phase792|through 792|e2e-phase792' webui/STATUS.md
echo "STATUS min/max size ok"
echo "cleaned"
echo "OK: phase788 e2e passed"
