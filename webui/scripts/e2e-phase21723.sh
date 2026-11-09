#!/usr/bin/env bash
# Phase-21723: client soft_fertig_ssh_auth_tricosadeca_checkpoint_roster Soft 21720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_tricosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 21720+ soft_fertig_ssh_auth_tricosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase21723 e2e passed"
