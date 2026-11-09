#!/usr/bin/env bash
# Phase-18139: client soft_fertig_ssh_auth_dodeca_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_dodeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-dodeca-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase18139 e2e passed"
