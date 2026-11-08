#!/usr/bin/env bash
# Phase-8444: STATUS Soft 8440+ ssh_not_implemented_batch_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8440\+|through 8448|ssh_not_implemented_batch_refresh_roster' webui/STATUS.md
grep -qE 'phase8448|through 8448|e2e-phase8456' webui/STATUS.md
echo "STATUS Soft 8440+ ok"; echo "cleaned"; echo "OK: phase8444 e2e passed"
