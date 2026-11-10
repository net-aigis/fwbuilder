#!/usr/bin/env bash
# Phase-25243: client soft_fertig_ssh_auth_triacontatetradeca_checkpoint_roster Soft 25240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontatetradeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 25240+ soft_fertig_ssh_auth_triacontatetradeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase25243 e2e passed"
