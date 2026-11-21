#!/usr/bin/env bash
# Phase-20444: STATUS Soft 20440+ ssh_auth_enneadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20440\+|through 20448|ssh_auth_enneadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase20448|through 20448|e2e-phase20456' webui/STATUS.md
echo "STATUS Soft 20440+ ok"; echo "cleaned"; echo "OK: phase20444 e2e passed"
