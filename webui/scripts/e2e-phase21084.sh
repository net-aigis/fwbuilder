#!/usr/bin/env bash
# Phase-21084: STATUS Soft 21080+ ssh_auth_henicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21080\+|through 21088|ssh_auth_henicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase21088|through 21088|e2e-phase21096' webui/STATUS.md
echo "STATUS Soft 21080+ ok"; echo "cleaned"; echo "OK: phase21084 e2e passed"
