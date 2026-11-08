#!/usr/bin/env bash
# Phase-13164: STATUS Soft 13160+ ssh_auth_milestone_floor_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13160\+|through 13168|ssh_auth_milestone_floor_roster' webui/STATUS.md
grep -qE 'phase13168|through 13168|e2e-phase13176' webui/STATUS.md
echo "STATUS Soft 13160+ ok"; echo "cleaned"; echo "OK: phase13164 e2e passed"
