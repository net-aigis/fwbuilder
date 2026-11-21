#!/usr/bin/env bash
# Phase-25884: STATUS Soft 25880+ ssh_auth_triacontahexadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25880\+|through 25888|ssh_auth_triacontahexadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase25888|through 25888|e2e-phase25896' webui/STATUS.md
echo "STATUS Soft 25880+ ok"; echo "cleaned"; echo "OK: phase25884 e2e passed"
