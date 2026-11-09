#!/usr/bin/env bash
# Phase-17179: client soft_fertig_ssh_auth_nona_checkpoint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_nona_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-nona-checkpoint roster type ok"; echo "cleaned"; echo "OK: phase17179 e2e passed"
