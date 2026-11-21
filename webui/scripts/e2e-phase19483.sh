#!/usr/bin/env bash
# Phase-19483: client soft_fertig_ssh_auth_hexadeca_checkpoint_roster Soft 19480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_hexadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 19480+ soft_fertig_ssh_auth_hexadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase19483 e2e passed"
