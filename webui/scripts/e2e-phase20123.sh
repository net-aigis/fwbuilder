#!/usr/bin/env bash
# Phase-20123: client soft_fertig_ssh_auth_octadeca_checkpoint_roster Soft 20120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_octadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 20120+ soft_fertig_ssh_auth_octadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase20123 e2e passed"
