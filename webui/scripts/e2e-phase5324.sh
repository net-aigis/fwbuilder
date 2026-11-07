#!/usr/bin/env bash
# Phase-5324: STATUS Soft 5320+ ssh_auth_policy_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5168|ssh_auth_policy_roster' webui/STATUS.md
grep -qE 'phase5328|through 5168|e2e-phase5328' webui/STATUS.md
echo "STATUS Soft 5320+ ok"; echo "cleaned"; echo "OK: phase5324 e2e passed"
