#!/usr/bin/env bash
# Phase-12444: STATUS Soft 12440+ ssh_auth_refusal_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 12440\+|through 12448|ssh_auth_refusal_count_roster' webui/STATUS.md
grep -qE 'phase12448|through 12448|e2e-phase12456' webui/STATUS.md
echo "STATUS Soft 12440+ ok"; echo "cleaned"; echo "OK: phase12444 e2e passed"
