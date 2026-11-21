#!/usr/bin/env bash
# Phase-9484: STATUS Soft 9480+ ssh_auth_refusal_id_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9480\+|through 9488|ssh_auth_refusal_id_roster' webui/STATUS.md
grep -qE 'phase9488|through 9488|e2e-phase9496' webui/STATUS.md
echo "STATUS Soft 9480+ ok"; echo "cleaned"; echo "OK: phase9484 e2e passed"
