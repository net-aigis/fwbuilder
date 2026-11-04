#!/usr/bin/env bash
# Phase-780: STATUS mentions with_size_policy_minimum / 777-784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_size_policy_minimum|size_policy_minimum' webui/STATUS.md
grep -qE 'phase784|through 784|e2e-phase784' webui/STATUS.md
echo "STATUS minimum sample ok"
echo "cleaned"
echo "OK: phase780 e2e passed"
