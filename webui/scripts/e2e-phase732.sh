#!/usr/bin/env bash
# Phase-732: STATUS mentions expanding 729-736.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_size_policy_expanding|size_policy_expanding' webui/STATUS.md
grep -qE 'phase736|through 736|e2e-phase736' webui/STATUS.md
echo "STATUS 729-736 ok"
echo "cleaned"
echo "OK: phase732 e2e passed"
