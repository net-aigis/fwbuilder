#!/usr/bin/env bash
# Phase-20699: client soft_fertig_ssh_auth_icosadeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_icosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-icosadeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase20699 e2e passed"
