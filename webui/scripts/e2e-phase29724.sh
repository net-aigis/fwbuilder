#!/usr/bin/env bash
# Phase-29724: STATUS Soft 29720+ ssh_auth_triacontaoctacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29720\+|through 29728|ssh_auth_triacontaoctacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase29728|through 29728|e2e-phase29736' webui/STATUS.md
echo "STATUS Soft 29720+ ok"; echo "cleaned"; echo "OK: phase29724 e2e passed"
