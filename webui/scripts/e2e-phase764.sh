#!/usr/bin/env bash
# Phase-764: STATUS mentions with_size_policy_fixed / 761-768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_size_policy_fixed|size_policy_fixed' webui/STATUS.md
grep -qE 'phase768|through 768|e2e-phase768' webui/STATUS.md
echo "STATUS fixed sample ok"
echo "cleaned"
echo "OK: phase764 e2e passed"
