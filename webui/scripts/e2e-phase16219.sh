#!/usr/bin/env bash
# Phase-16219: client soft_fertig_ssh_auth_hexa_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_hexa_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-hexa-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase16219 e2e passed"
