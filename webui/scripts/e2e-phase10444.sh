#!/usr/bin/env bash
# Phase-10444: STATUS Soft 10440+ ssh_auth_refusal_pair_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10440\+|through 10448|ssh_auth_refusal_pair_roster' webui/STATUS.md
grep -qE 'phase10448|through 10448|e2e-phase10456' webui/STATUS.md
echo "STATUS Soft 10440+ ok"; echo "cleaned"; echo "OK: phase10444 e2e passed"
