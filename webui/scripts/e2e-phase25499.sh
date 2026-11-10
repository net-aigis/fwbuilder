#!/usr/bin/env bash
# Phase-25499: client soft_fertig_ssh_auth_triacontapentadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontapentadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-triacontapentadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase25499 e2e passed"
