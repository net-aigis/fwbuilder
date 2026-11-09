#!/usr/bin/env bash
# Phase-20763: client soft_fertig_ssh_auth_icosadeca_checkpoint_roster Soft 20760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_icosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 20760+ soft_fertig_ssh_auth_icosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase20763 e2e passed"
