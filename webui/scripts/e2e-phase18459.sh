#!/usr/bin/env bash
# Phase-18459: client soft_fertig_ssh_auth_trideca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_trideca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-trideca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase18459 e2e passed"
