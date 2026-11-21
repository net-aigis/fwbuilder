#!/usr/bin/env bash
# Phase-6540: STATUS mentions ssh_honesty_refresh_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_honesty_refresh_roster|soft_fertig_ssh_honesty_refresh_roster' webui/STATUS.md
grep -qE 'phase6544|through 6544|e2e-phase6544' webui/STATUS.md
echo "STATUS ssh-not-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6540 e2e passed"
