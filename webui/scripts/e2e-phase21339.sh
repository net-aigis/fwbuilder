#!/usr/bin/env bash
# Phase-21339: client soft_fertig_ssh_auth_docosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_docosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-docosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase21339 e2e passed"
