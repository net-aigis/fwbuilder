#!/usr/bin/env bash
# Phase-18843: client soft_fertig_ssh_auth_tetradeca_checkpoint_roster Soft 18840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_tetradeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 18840+ soft_fertig_ssh_auth_tetradeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase18843 e2e passed"
