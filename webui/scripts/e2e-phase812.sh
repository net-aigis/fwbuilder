#!/usr/bin/env bash
# Phase-812: STATUS mentions with_size_policy_preferred / 809-816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_size_policy_preferred|size_policy_preferred' webui/STATUS.md
grep -qE 'phase816|through 816|e2e-phase816' webui/STATUS.md
echo "STATUS preferred sample ok"
echo "cleaned"
echo "OK: phase812 e2e passed"
