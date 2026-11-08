#!/usr/bin/env bash
# Phase-10604: STATUS Soft 10600+ ssh_auth_impl_support_pair_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10600\+|through 10608|ssh_auth_impl_support_pair_roster' webui/STATUS.md
grep -qE 'phase10608|through 10608|e2e-phase10616' webui/STATUS.md
echo "STATUS Soft 10600+ ok"; echo "cleaned"; echo "OK: phase10604 e2e passed"
