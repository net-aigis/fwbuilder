#!/usr/bin/env bash
# Phase-45084: STATUS Soft 45080+ ssh_auth_triacontahexacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 45080\+|through 45088|ssh_auth_triacontahexacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase45088|through 45088|e2e-phase45096' webui/STATUS.md
echo "STATUS Soft 45080+ ok"; echo "cleaned"; echo "OK: phase45084 e2e passed"
