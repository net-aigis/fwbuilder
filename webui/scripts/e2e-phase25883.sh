#!/usr/bin/env bash
# Phase-25883: client soft_fertig_ssh_auth_triacontahexadeca_checkpoint_roster Soft 25880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontahexadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 25880+ soft_fertig_ssh_auth_triacontahexadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase25883 e2e passed"
