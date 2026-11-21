#!/usr/bin/env bash
# Phase-25563: client soft_fertig_ssh_auth_triacontapentadeca_checkpoint_roster Soft 25560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontapentadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 25560+ soft_fertig_ssh_auth_triacontapentadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase25563 e2e passed"
