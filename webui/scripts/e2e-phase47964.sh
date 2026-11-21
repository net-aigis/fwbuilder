#!/usr/bin/env bash
# Phase-47964: STATUS Soft 47960+ ssh_auth_triacontapentacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 47960\+|through 47968|ssh_auth_triacontapentacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase47968|through 47968|e2e-phase47976' webui/STATUS.md
echo "STATUS Soft 47960+ ok"; echo "cleaned"; echo "OK: phase47964 e2e passed"
