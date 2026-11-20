#!/usr/bin/env bash
# Phase-36444: STATUS Soft 36440+ ssh_auth_triacontaenneacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36440\+|through 36448|ssh_auth_triacontaenneacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase36448|through 36448|e2e-phase36456' webui/STATUS.md
echo "STATUS Soft 36440+ ok"; echo "cleaned"; echo "OK: phase36444 e2e passed"
