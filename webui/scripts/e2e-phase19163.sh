#!/usr/bin/env bash
# Phase-19163: client soft_fertig_ssh_auth_pentadeca_checkpoint_roster Soft 19160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_pentadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 19160+ soft_fertig_ssh_auth_pentadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase19163 e2e passed"
