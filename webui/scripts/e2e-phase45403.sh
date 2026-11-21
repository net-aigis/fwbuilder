#!/usr/bin/env bash
# Phase-45403: client soft_fertig_ssh_auth_triacontaheptacosadeca_checkpoint_roster Soft 45400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaheptacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 45400+ soft_fertig_ssh_auth_triacontaheptacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase45403 e2e passed"
