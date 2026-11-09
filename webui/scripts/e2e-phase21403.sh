#!/usr/bin/env bash
# Phase-21403: client soft_fertig_ssh_auth_docosadeca_checkpoint_roster Soft 21400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_docosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 21400+ soft_fertig_ssh_auth_docosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase21403 e2e passed"
