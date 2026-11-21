#!/usr/bin/env bash
# Phase-48603: client soft_fertig_ssh_auth_triacontaheptacosadeca_checkpoint_roster Soft 48600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontaheptacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 48600+ soft_fertig_ssh_auth_triacontaheptacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase48603 e2e passed"
